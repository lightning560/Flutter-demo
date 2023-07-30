import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:like_button/like_button.dart';

import '../comment/comment_floor_counter_widget.dart';
import '../comment/comment_floor_widget.dart';
import '../comment/comment_reply_widget.dart';
import 'image_swiper_widget.dart';

class ImagePostPage extends StatefulHookConsumerWidget {
  const ImagePostPage({super.key});

  @override
  ConsumerState<ImagePostPage> createState() => _ImagePostPageState();
}

class _ImagePostPageState extends ConsumerState<ImagePostPage> {
  late TextEditingController _controller;
  var inputActive = false;
  var focusNode = FocusNode();

  List<Widget> getWidgets() {
    return [
      ImageSwiperWidget(),
      Row(
        children: [
          Spacer(),
          Text("title",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          Spacer()
        ],
      ),
      Text(
          "text body.A vertically stacked set of interactive headings that each reveal a section of content."),
      Row(
        children: [
          Spacer(),
          Text("published at 2023/07/01 ",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
        ],
      ),
      Divider(),
      Text("99 replies"),
      Row(
        children: [
          Icon(Icons.person_2),
          Spacer(),
          FilledButton.tonal(
              onPressed: () {
                inputActive = !inputActive;
                setState(() {});
              },
              child: Text("reply some things",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(350, 35)),
                backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
              )),
        ],
      ),
      CommentFloorWidget(),
      CommentReplyWidget(),
      CommentFloorCounterWidget(),
    ];
  }

  @override
  void initState() {
    _controller = TextEditingController();
    focusNode.addListener(() {
      debugPrint("_ImagePostPageState:focusNode");
      print(focusNode.hasFocus);
      inputActive = focusNode.hasFocus;
    });
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = getWidgets();
    widgets.add(CommentFloorWidget());
    widgets.add(CommentReplyWidget());
    widgets.add(CommentFloorCounterWidget());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        leadingWidth: 60,
        // leading: Icon(Icons.home),
        title: Row(
          children: [Text('ImagePost'), Icon(Icons.home)],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.delete),
          // ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.update),
          // ),
        ],
        // 自定义图标样式
        actionsIconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
          child: Stack(
        children: [
          ListView.builder(
            addAutomaticKeepAlives: true,
            // Let the ListView know how many items it needs to build.
            itemCount: widgets.length,
            // Provide a builder function. This is where the magic happens.
            // Convert each item into a widget based on the type of item it is.
            itemBuilder: (context, index) {
              var item = widgets[index];
              return item;
            },
          ),
          if (inputActive)
            SizedBox(
                // height: 300,
                // width: 300,
                child: ModalBarrier(
              // dismissible: inputActive,
              color: Colors.black26,
              onDismiss: () {
                setState(() {
                  inputActive = false;
                });
              },
            )),
          if (inputActive)
            Positioned(
                // bottom: MediaQuery.of(context).viewInsets.bottom / 2,
                bottom: 10,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width - 80,
                                child: TextField(
                                  controller: _controller,
                                  focusNode: focusNode,
                                  autofocus: true,
                                  keyboardType: TextInputType.text,
                                  textInputAction:
                                      TextInputAction.done, // keyboard done key
                                  maxLines: 1,
                                  maxLengthEnforcement:
                                      MaxLengthEnforcement.none,
                                )),
                            TextButton(
                              child: Text("send"),
                              onPressed: () {},
                            )
                          ],
                        ))))
        ],
      )),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[100],
        child: IconTheme(
          data: IconThemeData(color: Colors.black),
          child: Row(
            children: <Widget>[
              FilledButton.tonal(
                  onPressed: () {
                    inputActive = !inputActive;
                    setState(() {});
                  },
                  child: Text("reply some things",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(200, 35)),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey[300]),
                  )),
              const Spacer(),
              LikeButton(
                  likeBuilder: (bool isLiked) {
                    return const Icon(CupertinoIcons.heart);
                  },
                  likeCount: 520),
              LikeButton(
                  likeBuilder: (bool isLiked) {
                    return const Icon(CupertinoIcons.star);
                  },
                  likeCount: 520),
              LikeButton(
                  likeBuilder: (bool isLiked) {
                    return const Icon(CupertinoIcons.chat_bubble);
                  },
                  likeCount: 520),
            ],
          ),
        ),
      ),
    );
  }
}
