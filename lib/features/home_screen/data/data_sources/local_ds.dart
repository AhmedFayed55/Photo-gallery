import 'package:photo_gallery/features/home_screen/data/models/hive_models/get_photos_hive_dto.dart';

abstract interface class HomeLocalDataSource {
  Future<GetPhotosHiveDto> getPhotos();

  void savePhotos(GetPhotosHiveDto photosDto);
}
