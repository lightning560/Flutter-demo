import 'package:flutter/material.dart';
import 'package:flutter_rb/widgets/image/rb_image.dart';

class MallCollectionDetailWidget extends StatelessWidget {
  const MallCollectionDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flex(
          direction: Axis.vertical,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Detail",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            RbImage(
                src:
                    "https://sns-img-hw.xhscdn.com/e36218ee-9121-6e97-c119-4fcf802cf4ab?imageView2/2/h/1600/format/webp"),
            RbImage(
                src:
                    "https://sns-img-qc.xhscdn.com/781441a8-f4b2-8b3c-41c5-97040e477725?imageView2/2/h/1200/format/webp"),
          ],
        ),
      ],
    );
  }
}
