import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImageSwiperWidget extends StatefulHookConsumerWidget {
  ImageSwiperWidget({Key? key}) : super(key: key);

  @override
  _ImageSwiperWidgetState createState() => _ImageSwiperWidgetState();
}

class _ImageSwiperWidgetState extends ConsumerState<ImageSwiperWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "https://via.placeholder.com/350x350",
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
