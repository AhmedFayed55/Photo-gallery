import 'package:injectable/injectable.dart';
import 'package:photo_gallery/core/network/api_services.dart';
import 'package:photo_gallery/features/home_screen/data/data_sources/remote_ds.dart';

import '../models/get_photos_dto.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiServices _apiServices;

  HomeRemoteDataSourceImpl(this._apiServices);

  @override
  Future<GetPhotosDto> getPhotos(String key, int page, int perPage) {
    return _apiServices.getPhotos(key, page, perPage);
  }
}
