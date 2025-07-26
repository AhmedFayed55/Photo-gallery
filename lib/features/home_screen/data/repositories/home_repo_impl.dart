import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_gallery/core/network/api_constants.dart';
import 'package:photo_gallery/core/network/api_result.dart';
import 'package:photo_gallery/features/home_screen/data/models/get_photos_dto.dart';
import 'package:photo_gallery/features/home_screen/domain/entities/get_photos_entity.dart';

import '../../../../core/failures/failures.dart';
import '../../domain/repositories/home_repo.dart';
import '../data_sources/local_ds.dart';
import '../data_sources/remote_ds.dart';
import '../models/hive_models/get_photos_hive_dto.dart';
import '../models/mapers/maper.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;
  final HomeLocalDataSource _localDataSource;

  HomeRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<ApiResult<List<PhotosEntity>>> getPhotos() async {
    try {
      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        GetPhotosDto photosDto = await _remoteDataSource.getPhotos(
          ApiConstants.apiKey,
          2,
          40,
        );

        final GetPhotosHiveDto hiveDto = toGetPhotosHiveDto(photosDto);
        _localDataSource.savePhotos(hiveDto);

        List<PhotosEntity> photosEntityList =
            photosDto.photos?.map((photo) => photo.toEntity()).toList() ?? [];

        return ApiSuccessResult<List<PhotosEntity>>(data: photosEntityList);
      } else {
        GetPhotosHiveDto photosHiveDto = await _localDataSource.getPhotos();

        List<PhotosEntity> photosEntityList =
            photosHiveDto.photos?.map((photo) => photo.toEntity()).toList() ??
            [];
        return ApiSuccessResult<List<PhotosEntity>>(data: photosEntityList);
      }
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
