import 'package:flutter_test/flutter_test.dart';
import 'package:photo_gallery/features/home_screen/data/models/hive_models/photos_hive_dto.dart';
import 'package:photo_gallery/features/home_screen/data/models/hive_models/src_hive_dto.dart';

void main() {
  test(
    "when call toEntity with null values it should return PhotosEntity with null values",
    () {
      final photosHiveDto = PhotosHiveDto(
        id: null,
        width: null,
        height: null,
        url: null,
        photographer: null,
        photographerUrl: null,
        photographerId: null,
        avgColor: null,
        src: null,
        liked: null,
        alt: null,
      );

      final actualResult = photosHiveDto.toEntity();

      expect(actualResult.id, null);
      expect(actualResult.width, null);
      expect(actualResult.height, null);
      expect(actualResult.url, null);
      expect(actualResult.src, null);
    },
  );

  test(
    "when call toEntity with non-null values it should return PhotosEntity with correct values",
    () {
      final photosHiveDto = PhotosHiveDto(
        id: 1,
        width: 800,
        height: 600,
        url: "https://example.com/photo.jpg",
        photographer: "John Doe",
        photographerUrl: "https://example.com/johndoe",
        photographerId: 123,
        avgColor: "#FFFFFF",
        src: SrcHiveDto(
          original: "https://example.com/photo_original.jpg",
          large: "https://example.com/photo_large.jpg",
          medium: "https://example.com/photo_medium.jpg",
          small: "https://example.com/photo_small.jpg",
          portrait: "https://example.com/photo_portrait.jpg",
          landscape: "https://example.com/photo_landscape.jpg",
          tiny: "https://example.com/photo_tiny.jpg",
        ),
        liked: true,
        alt: "A beautiful photo",
      );

      final actualResult = photosHiveDto.toEntity();

      expect(actualResult.id, photosHiveDto.id);
      expect(actualResult.width, photosHiveDto.width);
      expect(actualResult.height, photosHiveDto.height);
      expect(actualResult.url, photosHiveDto.url);
      expect(actualResult.src?.original, photosHiveDto.src?.original);
      expect(actualResult.src?.large, photosHiveDto.src?.large);
      expect(actualResult.src?.medium, photosHiveDto.src?.medium);
      expect(actualResult.src?.small, photosHiveDto.src?.small);
      expect(actualResult.src?.portrait, photosHiveDto.src?.portrait);
      expect(actualResult.src?.landscape, photosHiveDto.src?.landscape);
      expect(actualResult.src?.tiny, photosHiveDto.src?.tiny);
    },
  );
}
