import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class CommentFloorWidget extends StatelessWidget {
  const CommentFloorWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Icon(CupertinoIcons.person),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            child: Column(
              children: [
                Row(
                  children: [
                    Text('name',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        )),
                    Icon(Icons.verified, size: 14)
                  ],
                ),
                Row(
                  children: [
                    Text('reply content'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('2023 / 07 / 07',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                    LikeButton(
                      size: 24,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
