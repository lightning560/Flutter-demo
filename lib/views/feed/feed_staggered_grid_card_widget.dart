import 'package:flutter/cupertino.dart';
import 'package:flutter_rb/core/providers/feed/feed_kind_enum.dart';
import 'package:flutter_rb/widgets/image/rb_image.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:like_button/like_button.dart';

import '../../core/models/feed/card/feed_card.dart';

class FeedStaggeredGridCardWidget extends HookConsumerWidget {
  String routeTo;
  FeedCard feedCard;
  FeedStaggeredGridCardWidget(
      {super.key, required this.feedCard, required this.routeTo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("feedcard:--------");
    print(feedCard);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeTo);
      },
      // height: 350,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Stack(
            children: [
              RbImage(src: feedCard.cover!, fit: BoxFit.fitHeight),
              Positioned(
                  top: 10,
                  right: 10,
                  child: feedCard.type == FeedKind.video
                      ? const Icon(
                          CupertinoIcons.play_arrow_solid,
                          size: 32,
                        )
                      : const SizedBox.shrink()),
              Positioned(
                  bottom: 10,
                  left: 10,
                  child: feedCard.haveProduct!
                      ? const Icon(CupertinoIcons.bag_fill)
                      : const SizedBox.shrink()),
              Positioned(
                  bottom: 10,
                  right: 10,
                  child: feedCard.isSponsored!
                      ? const Icon(CupertinoIcons.speaker)
                      : const SizedBox.shrink()),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(feedCard.title!,
                maxLines: 2,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 28,
                height: 28,
                child: ClipOval(
                  child: RbImage(src: feedCard.avatar!, fit: BoxFit.fill),
                ),
              ),
              Text(feedCard.name!),
              Spacer(),
              LikeButton(
                  likeBuilder: (bool isLiked) {
                    return const Icon(CupertinoIcons.heart);
                  },
                  likeCount: feedCard.likeCnt),
              // Text(feedCard.likeCnt.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
