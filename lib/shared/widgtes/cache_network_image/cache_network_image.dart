import 'package:cached_network_image/cached_network_image.dart';
import 'package:cubit_example/shared/widgtes/loading/loading.dart';
import 'package:flutter/material.dart';

class MovieXCachedNetworkImage extends StatelessWidget {
  final String pathImage;
  const MovieXCachedNetworkImage({
    required this.pathImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: pathImage,
      imageBuilder: (context, imageProvider) => Container(
        width: 100,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => const MovieXLoading(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
