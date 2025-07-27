import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_gallery/core/utils/app_constants.dart';

import '../models/hive_models/get_photos_hive_dto.dart';
import 'local_ds.dart';

@Injectable(as: HomeLocalDataSource)
class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final HiveInterface _hive;

  HomeLocalDataSourceImpl(this._hive);

  @override
  Future<GetPhotosHiveDto> getPhotos() async {
    var box = await _hive.openBox(AppConstants.photosBox);
    var photos = box.get(AppConstants.photosKey);
    return photos;
  }

  @override
  Future<void> savePhotos(GetPhotosHiveDto photosDto) async {
    var box = await _hive.openBox(AppConstants.photosBox);
    await box.put(AppConstants.photosKey, photosDto); // map
    await box.close();
  }
}
