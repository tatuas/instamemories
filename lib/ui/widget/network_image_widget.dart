import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class NetworkImageWidget extends StatelessWidget {
  final String imageUrl;

  NetworkImageWidget(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: imageUrl,
      fit: BoxFit.cover,
    );
  }
}
