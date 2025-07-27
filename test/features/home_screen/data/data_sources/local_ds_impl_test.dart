import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:photo_gallery/core/utils/app_constants.dart';
import 'package:photo_gallery/features/home_screen/data/data_sources/local_ds_impl.dart';
import 'package:photo_gallery/features/home_screen/data/models/hive_models/get_photos_hive_dto.dart';
import 'package:photo_gallery/features/home_screen/data/models/hive_models/photos_hive_dto.dart';
import 'package:photo_gallery/features/home_screen/data/models/hive_models/src_hive_dto.dart';

import 'local_ds_impl_test.mocks.dart';

@GenerateMocks([HiveInterface, Box])
void main() {
  late MockHiveInterface mockHive;
  late MockBox<GetPhotosHiveDto> mockBox;
  late HomeLocalDataSourceImpl localDataSource;

  setUp(() {
    mockHive = MockHiveInterface();
    mockBox = MockBox<GetPhotosHiveDto>();
    localDataSource = HomeLocalDataSourceImpl(mockHive);
  });

  group("HomeLocalDataSourceImpl", () {
    test(
      "verify when call getPhotos it should get photos from local caching (hive)",
      () async {
        // arrange
        var expectedResponse = GetPhotosHiveDto(
          page: 1,
          perPage: 10,
          totalResults: 100,
          nextPage: 'nextPageUrl',
          prevPage: 'prevPageUrl',
          photos: [
            PhotosHiveDto(
              id: 1,
              width: 800,
              height: 600,
              url: 'http://example.com/photo1.jpg',
              photographer: 'John Doe',
              photographerUrl: 'http://example.com/johndoe',
              photographerId: 123,
              avgColor: '#FFFFFF',
              src: SrcHiveDto(
                original: 'http://example.com/photo1_original.jpg',
                large: 'http://example.com/photo1_large.jpg',
                medium: 'http://example.com/photo1_medium.jpg',
                small: 'http://example.com/photo1_small.jpg',
                portrait: 'http://example.com/photo1_portrait.jpg',
                landscape: 'http://example.com/photo1_landscape.jpg',
                tiny: 'http://example.com/photo1_tiny.jpg',
              ),
              liked: true,
              alt: 'A beautiful scenery',
            ),
            PhotosHiveDto(
              id: 2,
              width: 1024,
              height: 768,
              url: 'http://example.com/photo2.jpg',
              photographer: 'Jane Smith',
              photographerUrl: 'http://example.com/janesmith',
              photographerId: 456,
              avgColor: '#000000',
              src: SrcHiveDto(
                original: 'http://example.com/photo2_original.jpg',
                large: 'http://example.com/photo2_large.jpg',
                medium: 'http://example.com/photo2_medium.jpg',
                small: 'http://example.com/photo2_small.jpg',
                portrait: 'http://example.com/photo2_portrait.jpg',
                landscape: 'http://example.com/photo2_landscape.jpg',
                tiny: 'http://example.com/photo2_tiny.jpg',
              ),
              liked: false,
              alt: 'A stunning sunset',
            ),
          ],
        );

        when(
          mockHive.openBox<GetPhotosHiveDto>(AppConstants.photosBox),
        ).thenAnswer((_) async => mockBox);

        when(mockBox.get(AppConstants.photosKey)).thenReturn(expectedResponse);

        // act
        final actualResult = await localDataSource.getPhotos();

        // assert
        verify(mockBox.get(AppConstants.photosKey)).called(1);
        expect(actualResult, expectedResponse);
        expect(
          actualResult?.photos?.length,
          equals(expectedResponse.photos?.length),
        );
      },
    );

    test("verify when savePhotos should save photos to box", () async {
      // arrange
      final testPhotos = GetPhotosHiveDto(
        page: 1,
        perPage: 10,
        totalResults: 100,
        nextPage: 'nextPageUrl',
        prevPage: 'prevPageUrl',
        photos: [
          PhotosHiveDto(
            id: 1,
            width: 800,
            height: 600,
            url: 'http://example.com/photo1.jpg',
            photographer: 'John Doe',
            photographerUrl: 'http://example.com/johndoe',
            photographerId: 123,
            avgColor: '#FFFFFF',
            src: SrcHiveDto(
              original: 'http://example.com/photo1_original.jpg',
              large: 'http://example.com/photo1_large.jpg',
              medium: 'http://example.com/photo1_medium.jpg',
              small: 'http://example.com/photo1_small.jpg',
              portrait: 'http://example.com/photo1_portrait.jpg',
              landscape: 'http://example.com/photo1_landscape.jpg',
              tiny: 'http://example.com/photo1_tiny.jpg',
            ),
            liked: true,
            alt: 'A beautiful scenery',
          ),
          PhotosHiveDto(
            id: 2,
            width: 1024,
            height: 768,
            url: 'http://example.com/photo2.jpg',
            photographer: 'Jane Smith',
            photographerUrl: 'http://example.com/janesmith',
            photographerId: 456,
            avgColor: '#000000',
            src: SrcHiveDto(
              original: 'http://example.com/photo2_original.jpg',
              large: 'http://example.com/photo2_large.jpg',
              medium: 'http://example.com/photo2_medium.jpg',
              small: 'http://example.com/photo2_small.jpg',
              portrait: 'http://example.com/photo2_portrait.jpg',
              landscape: 'http://example.com/photo2_landscape.jpg',
              tiny: 'http://example.com/photo2_tiny.jpg',
            ),
            liked: false,
            alt: 'A stunning sunset',
          ),
        ],
      );

      when(
        mockHive.openBox<GetPhotosHiveDto>(AppConstants.photosBox),
      ).thenAnswer((_) async => mockBox);

      when(
        mockBox.put(AppConstants.photosKey, testPhotos),
      ).thenAnswer((_) async => Future.value());

      when(mockBox.close()).thenAnswer((_) async => Future.value());

      // act
      await localDataSource.savePhotos(testPhotos);

      // assert
      verify(mockBox.put(AppConstants.photosKey, testPhotos)).called(1);
      verify(mockBox.close()).called(1);
    });
  });
}
