import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MallCollectionBottomBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomAppBar(
      color: Colors.white,
      // shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
      child: Row(
        children: [
          IconButton(
            icon: Icon(CupertinoIcons.airplane),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(CupertinoIcons.bubble_middle_bottom),
            onPressed: () {},
          ),
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.cart)),
          Spacer(),
          OutlinedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)),
            child: Text("Add to Cart", style: TextStyle(color: Colors.black)),
          ),
          Spacer(),
          OutlinedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red[500])),
            child: Text(
              "Buy Now",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
      ),
    );
  }
}
