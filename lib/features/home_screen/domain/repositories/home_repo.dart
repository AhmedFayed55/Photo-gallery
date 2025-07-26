import 'package:photo_gallery/core/network/api_result.dart';
import 'package:photo_gallery/features/home_screen/domain/entities/get_photos_entity.dart';

abstract interface class HomeRepository {
  Future<ApiResult<List<PhotosEntity>>> getPhotos();
}
