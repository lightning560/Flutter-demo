import 'package:flutter/material.dart';

class CommentFloorCounterWidget extends StatelessWidget {
  int? count = 0;
  CommentFloorCounterWidget({super.key, this.count});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 60,
        ),
        Text(
          "view 9 Replies",
          style: const TextStyle(
              color: Color.fromARGB(255, 0, 116, 174), fontSize: 12),
        ),
      ],
    );
  }
}
