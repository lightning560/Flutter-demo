import 'package:flutter/material.dart';

import '../../feed/comment/comment_floor_counter_widget.dart';
import '../../feed/comment/comment_floor_widget.dart';
import '../../feed/comment/comment_reply_widget.dart';

/// not using
class CommentContainerWidget extends StatelessWidget {
  List<Widget> getWidgets() {
    return [
      Divider(),
      CommentFloorWidget(),
      CommentReplyWidget(),
      CommentFloorCounterWidget(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      addAutomaticKeepAlives: true,
      // Let the ListView know how many items it needs to build.
      itemCount: 1,
      // Provide a builder function. This is where the magic happens.
      // Convert each item into a widget based on the type of item it is.
      itemBuilder: (context, index) {
        var item = Text("data");
        return item;
      },
    );
  }
}
