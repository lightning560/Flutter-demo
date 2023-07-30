import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RbImage extends StatelessWidget {
  String src = "";
  BoxFit? fit;

  RbImage({super.key, required this.src, this.fit});
  @override
  Widget build(BuildContext context) {
    // imageUrl: "http://via.placeholder.com/350x150",
    return CachedNetworkImage(
        imageUrl: src,
        placeholder: (context, url) => const CircularProgressIndicator(),
        // progressIndicatorBuilder: (context, url, downloadProgress) =>
        //     LinearProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: fit);
  }
}
