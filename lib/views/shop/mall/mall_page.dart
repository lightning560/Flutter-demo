import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rb/views/shop/mall/aggregation_card_widget.dart';
import 'package:flutter_rb/views/shop/mall/collection_card_widget.dart';

import '../../../widgets/grid/staggered_grid_container.dart';
import 'channel_container_widget.dart';
import 'mall_image_banner_widget.dart';

class MallPage extends StatelessWidget {
  MallPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      AggregationCardWidget(),
      CollectionCardWidget(routeTo: '/shop/collection'),
      AggregationCardWidget(),
      CollectionCardWidget(routeTo: '/shop/collection'),
      AggregationCardWidget(),
      CollectionCardWidget(routeTo: '/shop/collection')
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [Icon(Icons.search)],
      ),
      body: Center(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            // 返回一个 Sliver 数组给外部可滚动组件。
            return <Widget>[
              // SliverAppBar(
              //   title: const Text('嵌套ListView'),
              //   pinned: true, // 固定在顶部
              //   forceElevated: innerBoxIsScrolled,
              // ),
              buildSliverList(2),
              // alist(), //构建一个 sliverList
            ];
          },
          body: StaggeredGridContainer(
            key: UniqueKey(),
            cards: list,
          ),
        ),
        //     Column(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     SizedBox(
        //         width: MediaQuery.of(context).size.width,
        //         height: 200,
        //         child: ImageBannerWidget()),
        //     SizedBox(
        //         width: MediaQuery.of(context).size.width,
        //         height: 200,
        //         child: ChannelCardWidget()),
        //     Expanded(
        //       child: StaggeredGridContainer(
        //         key: UniqueKey(),
        //         cards: list,
        //       ),
        //     ),
        //   ],
        // )
      ),
    );
  }

  // 构建固定高度的SliverList，count为列表项属相
  Widget buildSliverList([int count = 2]) {
    final dpr = window.devicePixelRatio;

    List<Widget> headList = [
      SizedBox(
          width: (window.physicalSize.width / dpr),
          height: 200,
          child: MallImageBannerWidget()),
      SizedBox(
          width: window.physicalSize.width / dpr,
          height: 200,
          child: ChannelCardWidget()),
    ];
    return SliverFixedExtentList(
      itemExtent: 200,
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          // return ListTile(title: Text('$index'));
          return headList[index];
        },
        childCount: count,
      ),
    );
  }

  Widget alist() {
    final dpr = window.devicePixelRatio;

    List<Widget> headList = [
      SizedBox(
          width: (window.physicalSize.width / dpr),
          height: 200,
          child: MallImageBannerWidget()),
    ];
    return SliverFixedExtentList(
      itemExtent: 200,
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          // return ListTile(title: Text('$index'));
          return headList[index];
        },
        childCount: 1,
      ),
    );
  }
}
