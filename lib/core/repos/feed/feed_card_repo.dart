// ignore_for_file: prefer_initializing_formals

import 'package:flutter_rb/core/common/http/rb_http.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../common/http/api.dart';
import '../../models/feed/card/feed_card.dart';

part 'feed_card_repo.g.dart';

class FeedCardsState {
  late List<FeedCard> feedCards;
  late int count = 0;
  late String s = '';
  FeedCardsState(List<FeedCard> feedCards, int count, String s) {
    this.feedCards = feedCards;
    this.count = count;
    this.s = s;
  }
}

final feedCardsTopicProvider = StateProvider.autoDispose<String>((_) => 'you');

@riverpod
class FeedCardsRepo extends _$FeedCardsRepo {
  final rbHttp = RbHttp();
  @override
  FutureOr<FeedCardsState> build() async {
    final feedCardsTopic = ref.watch(feedCardsTopicProvider);
    var data = await getFeedCards(feedCardsTopic);
    return FeedCardsState(data, data.length, '1');
  }

  Future<List<FeedCard>> getFeedCards(String topic) async {
    final res = await rbHttp.get("${Api.FEED_CARDS}?topic=$topic");
    // final List list = res.data['data'];
    final List list = res;
    for (var item in list) {
      item['topic'] = topic;
    }
    return list.map((feedCard) => FeedCard.fromJson(feedCard)).toList();
  }
}
