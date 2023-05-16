import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String image;
  ImageWidget({required this.image});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.3,
      fit: BoxFit.contain,
      imageUrl: image,
      progressIndicatorBuilder: (
        context,
        url,
        downloadProgress,
      ) =>
          LinearProgressIndicator(
        value: downloadProgress.progress,
      ),
      errorWidget: (
        context,
        url,
        error,
      ) =>
          Icon(Icons.error),
    );
  }
}
