// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rb/widgets/image/rb_image.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CollectionCardWidget extends HookConsumerWidget {
  String routeTo;

  CollectionCardWidget({super.key, required this.routeTo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("collection card:--------------");
    // print(feedCard);
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
              RbImage(
                  src:
                      'https://sns-img-bd.xhscdn.com/ac6bd060-5b5f-d258-ccfc-1aa8404b16ac?imageView2/2/w/648/format/webp',
                  fit: BoxFit.fitHeight),
              // Positioned(
              //     top: 10,
              //     right: 10,
              //     child: feedCard.kind == FeedKind.video
              //         ? const Icon(
              //             CupertinoIcons.play_arrow_solid,
              //             size: 32,
              //           )
              //         : const SizedBox.shrink()),
              // Positioned(
              //     bottom: 10,
              //     left: 10,
              //     child: feedCard.haveProduct!
              //         ? const Icon(CupertinoIcons.bag_fill)
              //         : const SizedBox.shrink()),
              // Positioned(
              //     bottom: 10,
              //     right: 10,
              //     child: feedCard.isSponsored!
              //         ? const Icon(CupertinoIcons.speaker)
              //         : const SizedBox.shrink()),
            ],
          ),
          _richTitle(),
          Row(children: [
            Icon(Icons.ac_unit),
            // Icon(Icons.zoom_out),
            SizedBox(
                width: 150,
                child:
                    Text(softWrap: true, "sadfsadfdfadssssssssssafsdasfdsafd"))
          ]),
          // Wrap(
          //   spacing: 8.0, // 主轴(水平)方向间距
          //   runSpacing: 4.0, // 纵轴（垂直）方向间距
          //   alignment: WrapAlignment.center, //沿主轴方向居中
          //   children: <Widget>[
          //     Chip(
          //       avatar: CircleAvatar(
          //           backgroundColor: Colors.blue, child: Text('A')),
          //       label: Text('Hamilton'),
          //     ),
          //     Chip(
          //       avatar: CircleAvatar(
          //           backgroundColor: Colors.blue, child: Text('M')),
          //       label: Text('Lafayette'),
          //     ),
          //     Chip(
          //       avatar: CircleAvatar(
          //           backgroundColor: Colors.blue, child: Text('H')),
          //       label: Text('Mulligan'),
          //     ),
          //     Chip(
          //       avatar: CircleAvatar(
          //           backgroundColor: Colors.blue, child: Text('J')),
          //       label: Text('Laurens'),
          //     ),
          //   ],
          // ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('¥price!',
                maxLines: 2,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                CupertinoIcons.star_fill,
                color: Colors.yellow,
              ),
              Text('4.5!'),
              Text('(99)'),
              Text('23 Sold'),
              Spacer(),
              Icon(CupertinoIcons.ellipsis),
            ],
          ),
          Row(
            children: [
              Icon(Icons.abc),
              Text("recomment reason"),
            ],
          )
        ],
      ),
    );
  }

  Widget _richTitle() {
    InlineSpan span = TextSpan(children: [
      WidgetSpan(child: Icon(Icons.abc)),
      WidgetSpan(child: Icon(Icons.ac_unit)),
      TextSpan(
        text: '我已同意 ',
      ),
      TextSpan(
        text: '服务条款',
      ),
      TextSpan(
        text: ' 和 ',
      ),
      TextSpan(
        text: '隐私政策',
      ),
    ]);

    return Text.rich(span);
  }
}
