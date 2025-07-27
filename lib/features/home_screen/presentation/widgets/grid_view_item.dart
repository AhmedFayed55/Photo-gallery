import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) =>
            Center(child: const CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.cover,
      ),
    );
  }
}
