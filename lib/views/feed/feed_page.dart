import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rb/core/providers/feed/feed_kind_enum.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/views/feed/feed_staggered_grid_card_widget.dart';
import '../../widgets/grid/staggered_grid_container.dart';
import '/core/repos/feed/feed_card_repo.dart';

class FeedPage extends StatefulHookConsumerWidget {
  String topic;
  FeedPage({super.key, required this.topic});

  @override
  ConsumerState<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends ConsumerState<FeedPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // 是否需要缓存
  @override
  Widget build(BuildContext context) {
    super.build(context); // 必须调用
    /// for repo use,must before ref.watch(feedCardsRepoProvider)
    final feedCardsTopic = ref.read(feedCardsTopicProvider.notifier);
    feedCardsTopic.state = widget.topic;
    final cardsRepo = ref.watch(feedCardsRepoProvider);
    String routeTo;
    return RefreshIndicator(
      onRefresh: () async => ref.refresh(feedCardsRepoProvider),
      child: cardsRepo.when(
        data: (repo) {
          List<Widget> cards = [];
          for (final c in repo.feedCards) {
            switch (c.type) {
              case FeedKind.image:
                {
                  routeTo = "/imagePostPage";
                  break;
                }
              case FeedKind.video:
                {
                  routeTo = "/videoPageView";
                  break;
                }
              case FeedKind.live:
                {
                  routeTo = "/live_room";
                  break;
                }
            }
            cards.add(FeedStaggeredGridCardWidget(
                feedCard: c, routeTo: routeTo, key: UniqueKey()));
          }
          return StaggeredGridContainer(key: UniqueKey(), cards: cards);
        },
        // error: (err, stack) => Center(child: Text('FeedPageError: $err')),
        error: (err, stack) {
          BotToast.showText(text: "async value error");
          // BotToast.showSimpleNotification(title: "init");
          // return SizedBox.shrink();
          return Text('FeedPageError: $err');
        },
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
