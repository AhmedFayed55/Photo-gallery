import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_gallery/features/home_screen/domain/entities/get_photos_entity.dart';
import 'package:photo_gallery/features/home_screen/presentation/widgets/grid_view_item.dart';

class PhotosGridView extends StatelessWidget {
  const PhotosGridView({super.key, required this.photos});

  final List<PhotosEntity> photos;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(16),
      child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return GridViewItem(imageUrl: photos[index].src?.medium ?? '');
        },
      ),
    );
  }
}
