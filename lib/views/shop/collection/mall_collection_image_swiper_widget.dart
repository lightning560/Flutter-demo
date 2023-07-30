// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_rb/widgets/image/rb_image.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MallCollectionImageSwiperWidget extends StatefulHookConsumerWidget {
  MallCollectionImageSwiperWidget({Key? key}) : super(key: key);

  @override
  _MallCollectionImageSwiperState createState() =>
      _MallCollectionImageSwiperState();
}

class _MallCollectionImageSwiperState
    extends ConsumerState<MallCollectionImageSwiperWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return RbImage(
            src:
                "https://sns-img-hw.xhscdn.com/66406ad1-c262-f1d7-42ea-aa5fd97884c8?imageView2/2/w/640/format/webp",
            fit: BoxFit.cover,
          );
        },
        duration: 1000,
        itemCount: 7,
        pagination: SwiperPagination(
          alignment: Alignment.bottomRight,
          builder: FractionPaginationBuilder(
              activeFontSize: 16,
              fontSize: 16,
              activeColor: Colors.white,
              color: Colors.red),
        ),
        // control: SwiperControl(),
      ),
    );
  }
}
