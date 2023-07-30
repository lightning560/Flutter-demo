// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rb/widgets/grid/staggered_grid_container.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../widgets/image/rb_image.dart';
import 'mall_collection_bottom_bar.dart';
import 'mall_collection_detail_widget.dart';
import 'mall_collection_image_swiper_widget.dart';

class MallCollecionPage extends StatefulHookConsumerWidget {
  MallCollecionPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _MallCollectionPage();
  }
}

class _MallCollectionPage extends ConsumerState {
  final dpr = window.devicePixelRatio;
  ScrollController _scrollController = ScrollController();
  GlobalKey _k1 = GlobalKey();
  var renderBox1;
  _getRenderBox(_) {
    //获取`RenderBox`对象
    renderBox1 = _k1.currentContext?.findRenderObject();
    print("dpr:$dpr");
    print("_renderBoxG.size: ${renderBox1?.size}");
    print(
        "_renderBoxG.localToGlobal: ${renderBox1?.localToGlobal(Offset(0, 0))}");
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_getRenderBox);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _customScrollView(),
      bottomNavigationBar: MallCollectionBottomBar(),
    );
  }

  Widget _customScrollView() {
    List<Widget> list = [];
    return Scrollbar(
      child: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          // AppBar，包含一个导航栏.
          SliverAppBar(
            pinned: true, // 滑动到顶端时会固定住
            elevation: 0,
            expandedHeight: 350.0,
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
            flexibleSpace: FlexibleSpaceBar(
              // title: const Text('Demo'),
              background: MallCollectionImageSwiperWidget(),
            ),
            // bottom: TabBar(
            //   tabs: [
            //     Text("一"),
            //     Text("二"),
            //     Text("三"),
            //   ],
            // ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverHeaderDelegate.fixedHeight(
              //固定高度
              height: 50,
              child: Container(
                color: Colors.white,
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text("一",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ))),
                      TextButton(onPressed: () {}, child: Text("二")),
                      TextButton(onPressed: () {}, child: Text("三"))
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("¥218"), Text("99 sold")],
              ),
              Row(
                children: [
                  Expanded(child: Text("asdfghjklasdf")),
                  IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.star))
                ],
              ),
              _lineButtomSheet(context),
            ]),
          ),
          SliverToBoxAdapter(
            child: Column(
                mainAxisSize: MainAxisSize.min, children: [Text("Variations")]),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              child: MallCollectionDetailWidget(),
            ),
          ),
          SliverToBoxAdapter(
            child: StaggeredGridContainer(
              // key: UniqueKey(),
              key: _k1,
              cards: list,
            ),
          )
        ],
      ),
    );
  }

  Widget _bottomAppBar() {
    return BottomAppBar(
      color: Colors.white,
      // shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {},
          ),
          SizedBox(), //中间位置空出
          IconButton(
            icon: Icon(Icons.business),
            onPressed: () {},
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
      ),
    );
  }

  Widget _lineButtomSheet(context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 10, end: 15),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet<void>(
            // < -------------- key: showModalBottomSheet;属于BottomSheet
            context: context,
            builder: (context) {
              return Column(
                children: [Text("data")],
              );
            },
          ); // 这一行用于告诉系统，弹窗的内容完全由我们自己管理
        },
        child: Row(
          children: [
            SizedBox(
              width: 40,
              child: Text("title"),
            ),
            Expanded(
              child: Text("abcdefg"),
            ),
            SizedBox(
              width: 10,
              child: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}

typedef SliverHeaderBuilder = Widget Function(
    BuildContext context, double shrinkOffset, bool overlapsContent);

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  // child 为 header
  SliverHeaderDelegate({
    required this.maxHeight,
    this.minHeight = 0,
    required Widget child,
  })  : builder = ((a, b, c) => child),
        assert(minHeight <= maxHeight && minHeight >= 0);

  //最大和最小高度相同
  SliverHeaderDelegate.fixedHeight({
    required double height,
    required Widget child,
  })  : builder = ((a, b, c) => child),
        maxHeight = height,
        minHeight = height;

  //需要自定义builder时使用
  SliverHeaderDelegate.builder({
    required this.maxHeight,
    this.minHeight = 0,
    required this.builder,
  });

  final double maxHeight;
  final double minHeight;
  final SliverHeaderBuilder builder;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    Widget child = builder(context, shrinkOffset, overlapsContent);
    //测试代码：如果在调试模式，且子组件设置了key，则打印日志
    assert(() {
      if (child.key != null) {
        print('${child.key}: shrink: $shrinkOffset，overlaps:$overlapsContent');
      }
      return true;
    }());
    // 让 header 尽可能充满限制的空间；宽度为 Viewport 宽度，
    // 高度随着用户滑动在[minHeight,maxHeight]之间变化。
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverHeaderDelegate old) {
    return old.maxExtent != maxExtent || old.minExtent != minExtent;
  }
}
