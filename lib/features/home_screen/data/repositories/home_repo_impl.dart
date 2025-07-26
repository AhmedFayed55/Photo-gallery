import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_gallery/core/network/api_constants.dart';
import 'package:photo_gallery/core/network/api_result.dart';
import 'package:photo_gallery/features/home_screen/data/models/get_photos_dto.dart';
import 'package:photo_gallery/features/home_screen/domain/entities/get_photos_entity.dart';

import '../../../../core/failures/failures.dart';
import '../../domain/repositories/home_repo.dart';
import '../data_sources/remote_ds.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _dataSource;

  HomeRepositoryImpl(this._dataSource);

  @override
  Future<ApiResult<List<PhotosEntity>>> getPhotos() async {
    try {
      GetPhotosDto photosDto = await _dataSource.getPhotos(
        ApiConstants.apiKey,
        2,
        40,
      );

      List<PhotosEntity> photosEntityList =
          photosDto.photos?.map((photo) => photo.toEntity()).toList() ?? [];

      return ApiSuccessResult<List<PhotosEntity>>(data: photosEntityList);
    } on DioException catch (e) {
      return ApiErrorResult<List<PhotosEntity>>(
        failure: ServerFailure.fromDioError(dioException: e),
      );
    } catch (e) {
      return ApiErrorResult<List<PhotosEntity>>(
        failure: Failure(errorMessage: e.toString()),
      );
    }
  }
}
