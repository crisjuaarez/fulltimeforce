import 'package:flutter/material.dart';

class MyImageNetwork extends StatelessWidget {
  const MyImageNetwork(this.url, {super.key, this.heroTag, this.fit});

  final String url;
  final String? heroTag;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final image = Image.network(
      url,
      fit: fit,
      errorBuilder: (_, __, ___) => const SizedBox.shrink(),
    );
    if (heroTag != null) return Hero(tag: heroTag!, child: image);
    return image;
  }
}
