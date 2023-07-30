import 'package:flutter/material.dart';
import 'package:flutter_rb/widgets/image/rb_image.dart';

class AggregationCardWidget extends StatelessWidget {
  const AggregationCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: SizedBox(
          child: Column(
            children: [
              RbImage(src: "https://dummyimage.com/100x100&text=header"),
              Text("h5")
            ],
          ),
        ));
  }
}
