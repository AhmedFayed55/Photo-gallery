import 'package:photo_gallery/features/home_screen/data/models/get_photos_dto.dart';

abstract interface class HomeRemoteDataSource {
  Future<GetPhotosDto> getPhotos(String key, int page, int perPage);
}
