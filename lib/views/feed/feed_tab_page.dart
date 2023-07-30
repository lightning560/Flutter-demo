import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'feed_page.dart';

class FeedTabPage extends StatelessWidget {
  FeedTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: const Icon(
            CupertinoIcons.book_fill,
            color: Colors.yellow,
          ),
          actions: const [
            Icon(CupertinoIcons.search),
          ],
          bottom: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            splashBorderRadius: BorderRadius.circular(40),
            // automaticIndicatorColorAdjustment:true,
            isScrollable: true,
            // onTap: (value) => print('tabbar ontap:$value'),
            tabs: <Widget>[
              Tab(
                text: "follow",
              ),
              Tab(text: "for you"),
              Tab(
                text: "study",
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Text("It's follow here"),
            ),
            Center(
              child: FeedPage(key: UniqueKey(), topic: "you"),
            ),
            Center(
              child: Text("It's study here"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
}
