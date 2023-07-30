import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rb/core/providers/feed/video_post_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../core/common/mixin/widget_visibility_state_mixin.dart';

class VideoPostPage extends StatefulHookConsumerWidget {
  int pageIndex;
  // GlobalKey key;
  VideoPostPage({super.key, required this.pageIndex});

  @override
  ConsumerState<VideoPostPage> createState() => _VideoPostPageState();
}

class _VideoPostPageState extends ConsumerState<VideoPostPage>
    with WidgetVisibilityStateMixin, WidgetsBindingObserver {
  late VideoPlayerController _controller;
  late int _currIndex;
  // final AsyncMemoizer _memoizer = AsyncMemoizer();
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        // 'https://sf1-cdn-tos.huoshanstatic.com/obj/media-fe/xgplayer_doc_video/mp4/xgplayer-demo-720p.mp4'
        'https://sns-video-bd.xhscdn.com/stream/110/259/01e3e250e9454f7f01037003862c0f6c52_259.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setVolume(0);
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    print("video player disposing");
  }

  @override
  onHide() {
    super.onHide();
    print('隐藏');
    _controller.pause();
  }

  @override
  void onShow() {
    super.onShow();
    print('显示');
    print(widget.pageIndex);
    _controller.setVolume(100);
  }

  // _getPosition() {
  //   final RenderBox renderBox = widget.key.currentContext.findRenderObject();
  //   final positionGreen = renderBox.localToGlobal(Offset.zero);
  //   print("POSITION of green: $positionGreen");
  // }

  void handleChangedPage() {
    if (_controller.value.isInitialized) {
      if (_currIndex == widget.pageIndex) {
        _controller.setVolume(100);
        print("VideoPostPage");
        print(widget.pageIndex);
        print(_currIndex);
      }
      if (_currIndex - 1 == widget.pageIndex) {
        _controller.pause();
      }
      if (_currIndex + 1 == widget.pageIndex) {
        _controller.pause();
      }
    }
  }

// 定义一个key
  GlobalKey _key = GlobalKey();

  _getRenderBox() {
    //获取`RenderBox`对象
    final renderBox = _key.currentContext!.findRenderObject();
  }

  @override
  Widget build(BuildContext context) {
    // final renderBox = context.findRenderObject();
    // Offset offset = renderBox?.localToGlobal(Offset.zero);
    // print("POSITION: $offset");

    _currIndex = ref.watch(currVideoPageViewProvider);
    // handleChangedPage();
    return Scaffold(
      body: VisibilityDetector(
          // key: Key('my-widget-key'),
          key: Key("key+${widget.pageIndex.toString()}"),
          onVisibilityChanged: (visibilityInfo) {
            var visiblePercentage = visibilityInfo.visibleFraction * 100;
            debugPrint(
                'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
            if (visiblePercentage == 100) {
              _controller.play();
              _controller.setVolume(100);
            }
            if (visiblePercentage < 100) {
              _controller.pause();
            }
          },
          child: Stack(
            fit: StackFit.loose,
            children: [
              Column(
                children: [
                  Expanded(
                    child: Center(
                        child: _controller.value.isInitialized
                            ? AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              )
                            : const CircularProgressIndicator()),
                  )
                ],
              ),
              Positioned(
                bottom: 2,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 100,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  child: _controller.value.isInitialized
                      ? Container(
                          color: Color.fromRGBO(116, 75, 228, 0.1),
                          child: _controller.value.isPlaying
                              ? const SizedBox.shrink()
                              : const IconButton(
                                  icon: Icon(
                                    Icons.play_arrow_rounded,
                                    size: 64,
                                    color: Color.fromARGB(153, 127, 124, 124),
                                  ),
                                  onPressed: null,
                                ))
                      : Container(
                          color: Colors.amberAccent,
                        ),
                ),
              ),
              Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width,
                child: VideoProgressIndicator(
                  _controller,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                      backgroundColor: Colors.blueGrey,
                      bufferedColor: Colors.blueGrey,
                      playedColor: Colors.blueAccent),
                ),
              ),
            ],
          )),
    );
  }
}
