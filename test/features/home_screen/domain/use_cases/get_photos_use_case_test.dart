import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:photo_gallery/core/network/api_result.dart';
import 'package:photo_gallery/features/home_screen/domain/entities/get_photos_entity.dart';
import 'package:photo_gallery/features/home_screen/domain/repositories/home_repo.dart';
import 'package:photo_gallery/features/home_screen/domain/use_cases/get_photos_use_case.dart';

import 'get_photos_use_case_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  test(
    'when call getPhotos should return photosEntity from repo with correct parameters',
    () async {
      var expectedResult = [
        PhotosEntity(
          id: 1,
          width: 800,
          height: 600,
          url: 'https://example.com/photo1.jpg',
          src: SrcEntity(
            original: 'https://example.com/photo1_original.jpg',
            large2x: 'https://example.com/photo1_large2x.jpg',
            large: 'https://example.com/photo1_large.jpg',
            medium: 'https://example.com/photo1_medium.jpg',
            small: 'https://example.com/photo1_small.jpg',
            portrait: 'https://example.com/photo1_portrait.jpg',
            landscape: 'https://example.com/photo1_landscape.jpg',
            tiny: 'https://example.com/photo1_tiny.jpg',
          ),
        ),
        PhotosEntity(
          id: 2,
          width: 1024,
          height: 768,
          url: 'https://example.com/photo2.jpg',
          src: SrcEntity(
            original: 'https://example.com/photo2_original.jpg',
            large2x: 'https://example.com/photo2_large2x.jpg',
            large: 'https://example.com/photo2_large.jpg',
            medium: 'https://example.com/photo2_medium.jpg',
            small: 'https://example.com/photo2_small.jpg',
            portrait: 'https://example.com/photo2_portrait.jpg',
            landscape: 'https://example.com/photo2_landscape.jpg',
            tiny: 'https://example.com/photo2_tiny.jpg',
          ),
        ),
      ];

      var perPage = 20;
      var page = 2;

      MockHomeRepository mockHomeRepository = MockHomeRepository();
      GetPhotosUseCase useCase = GetPhotosUseCase(mockHomeRepository);

      provideDummy<ApiResult<List<PhotosEntity>>>(
        ApiSuccessResult(data: expectedResult),
      );

      when(mockHomeRepository.getPhotos(page, perPage)).thenAnswer(
        (_) async => ApiSuccessResult<List<PhotosEntity>>(data: expectedResult),
      );

      // act

      var result = await useCase.invoke(page: page, perPage: perPage);

      // assert

      verify(mockHomeRepository.getPhotos(page, perPage)).called(1);

      expect(result, isA<ApiSuccessResult<List<PhotosEntity>>>());
      result as ApiSuccessResult<List<PhotosEntity>>;
      expect(result.data, equals(expectedResult));
    },
  );
}
