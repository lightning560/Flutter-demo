import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rb/widgets/image/rb_image.dart';

class ChannelCardWidget extends StatelessWidget {
  const ChannelCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> mockData = List.generate(10, (index) {
      return _channelCard();
    });

    return Column(
      children: [
        Row(
          children: [for (int i = 0; i < 5; i++) mockData[i]],
        ),
        Row(
          children: [for (int i = 5; i < 10; i++) mockData[i]],
        )
      ],
    );
  }

  Widget _channelCard() {
    final dpr = window.devicePixelRatio;
    return GestureDetector(
        onTap: () {},
        child: SizedBox(
          width: (window.physicalSize.width / dpr) / 5,
          child: Column(
            children: [
              RbImage(src: "https://dummyimage.com/60x60&text=header"),
              Text("channel")
            ],
          ),
        ));
  }
}
