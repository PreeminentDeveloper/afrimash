import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

import '../utils/images.dart';

class FluxImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final Color color;

  const FluxImage({
    @required this.imageUrl,
    Key key,
    this.width,
    this.height,
    this.fit,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageProxy = '';

    if (!imageUrl.contains('http')) {
      return Image.asset(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        color: color,
      );
    }

    if (UniversalPlatform.isWeb) {
      imageProxy = kImageProxy;
    }

    return ExtendedImage.network(
      '$imageProxy$imageUrl',
      width: width,
      height: height,
      fit: fit,
      color: color,
      loadStateChanged: (state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            // implement loading widget for not web
            return UniversalPlatform.isWeb
                ? const SizedBox()
                : const SizedBox();
          case LoadState.failed:
            return const SizedBox();
          case LoadState.completed:
            return state.completedWidget;
          default:
            return const SizedBox();
        }
      },
    );
  }
}
