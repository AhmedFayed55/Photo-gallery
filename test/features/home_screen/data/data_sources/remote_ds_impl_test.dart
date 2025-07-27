import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:photo_gallery/core/network/api_services.dart';
import 'package:photo_gallery/features/home_screen/data/data_sources/remote_ds_impl.dart';
import 'package:photo_gallery/features/home_screen/data/models/get_photos_dto.dart';
import 'package:photo_gallery/features/home_screen/data/models/photos_dto.dart';

import 'remote_ds_impl_test.mocks.dart';

@GenerateMocks([ApiServices])
void main() {
  test(
    "verify when call getPhotos it should get photos from api with correct parameters",
    () async {
      //arrange

      MockApiServices mockApiServices = MockApiServices();
      HomeRemoteDataSourceImpl homeRemoteDataSourceImpl =
          HomeRemoteDataSourceImpl(mockApiServices);

      String key = 'test_key';
      int page = 2;
      int perPage = 10;

      var expectedResponse = GetPhotosDto(
        page: page,
        perPage: perPage,
        photos: [
          PhotosDto(
            id: 2,
            width: 100,
            height: 100,
            url: "http://example.com/photo1.jpg",
          ),
          PhotosDto(
            id: 3,
            width: 200,
            height: 200,
            url: "http://example.com/photo2.jpg",
          ),
        ],
        totalResults: 0,
        nextPage: "next_page_url",
        prevPage: "prev_page_url",
      );

      when(
        mockApiServices.getPhotos(key, page, perPage),
      ).thenAnswer((_) async => expectedResponse);

      //act

      final actualResult = await homeRemoteDataSourceImpl.getPhotos(
        key,
        page,
        perPage,
      );

      //assert

      verify(mockApiServices.getPhotos(key, page, perPage)).called(1);

      expect(actualResult, isA<GetPhotosDto>());
      expect(
        actualResult.photos?.length,
        equals(expectedResponse.photos?.length),
      );
    },
  );
}
