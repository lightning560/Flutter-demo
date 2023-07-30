// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:flutter/cupertino.dart';
import 'package:flutter_rb/core/providers/home/bottom_tab_provider.dart';
import 'package:flutter_rb/views/feed/feed_tab_page.dart';
import 'package:flutter_rb/views/feed/post/video_post_page.dart';
import 'package:flutter_rb/views/feed/post/videos_page_view.dart';
import 'package:flutter_rb/views/shop/collection/mall_collection_detail_widget.dart';
import 'package:flutter_rb/views/shop/mall/mall_page.dart';

import '../../widgets/grid/staggered_grid_container.dart';
import '../me/me_page.dart';

import 'home_bottom_tab.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_rb/widgets/image/rb_image.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter/material.dart';

class HomePage extends HookConsumerWidget {
  HomePage({super.key});
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<Widget> _naviViewList = <Widget>[
    //0
    FeedTabPage(),

    VideosPageView(),
    //2
    MallPage(),
    //3
    MallPage(),
    // CustomScrollViewDemoA(),
    //4
    MePage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(bottomTabIndexProvider);
    return Scaffold(
      body: Center(
        child: _naviViewList.elementAt(tabIndex),
      ),
      bottomNavigationBar: const HomeBottomTab(),
    );
  }
}
