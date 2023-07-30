import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/providers/feed/video_post_provider.dart';
import 'video_post_page.dart';

class VideosPageView extends StatefulHookConsumerWidget {
  const VideosPageView({super.key});
  @override
  ConsumerState<VideosPageView> createState() => _VideosPageViewState();
}

class _VideosPageViewState extends ConsumerState<VideosPageView> {
  late PageController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0, keepPage: true);
    _controller.addListener(() {
      //PageView滑动的距离
      double offset = _controller.offset;
      //当前显示的页面的索引
      double page = _controller.page!;
      print("pageView 滑动的距离 $offset  索引 $page");
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      allowImplicitScrolling: true,
      scrollDirection: Axis.vertical,
      controller: _controller,
      onPageChanged: (idx) {
        print(idx);
        ref.read(currVideoPageViewProvider.notifier).setCurr(idx);
      },
      children: <Widget>[
        VideoPostPage(pageIndex: 0, key: UniqueKey()),
        VideoPostPage(
          pageIndex: 1,
          key: UniqueKey(),
        ),
        const Center(
          child: Text('Third Page'),
        ),
      ],
    );
  }
}
