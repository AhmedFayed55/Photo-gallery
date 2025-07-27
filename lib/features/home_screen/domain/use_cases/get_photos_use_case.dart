import 'package:injectable/injectable.dart';
import 'package:photo_gallery/core/network/api_result.dart';
import 'package:photo_gallery/features/home_screen/domain/entities/get_photos_entity.dart';
import 'package:photo_gallery/features/home_screen/domain/repositories/home_repo.dart';

@injectable
class GetPhotosUseCase {
  final HomeRepository _repository;

  GetPhotosUseCase(this._repository);

  Future<ApiResult<List<PhotosEntity>>> invoke() async =>
      await _repository.getPhotos();
}
