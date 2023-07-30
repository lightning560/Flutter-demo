// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_rb/widgets/image/rb_image.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MallImageBannerWidget extends StatefulHookConsumerWidget {
  MallImageBannerWidget({Key? key}) : super(key: key);

  @override
  _ImageSwiperWidgetState createState() => _ImageSwiperWidgetState();
}

class _ImageSwiperWidgetState extends ConsumerState<MallImageBannerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return RbImage(
            src: "https://via.placeholder.com/400x200",
            fit: BoxFit.cover,
          );
        },
        itemCount: 7,
        pagination: SwiperPagination(),
        // control: SwiperControl(),
      ),
    );
  }
}
