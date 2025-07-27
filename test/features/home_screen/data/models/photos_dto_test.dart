import 'package:flutter_test/flutter_test.dart';
import 'package:photo_gallery/features/home_screen/data/models/photos_dto.dart';
import 'package:photo_gallery/features/home_screen/data/models/src_dto.dart';
import 'package:photo_gallery/features/home_screen/domain/entities/get_photos_entity.dart';

void main() {
  test(
    'when call toEntity with nullable values it should return PhotosDto with null values',
    () {
      PhotosDto photosDto = PhotosDto(
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

      PhotosEntity photosEntity = photosDto.toEntity();
      expect(photosEntity.id, isNull);
      expect(photosEntity.width, isNull);
      expect(photosEntity.height, isNull);
      expect(photosEntity.url, isNull);
      expect(photosEntity.src, isNull);
    },
  );

  test(
    'when call toEntity with non-null values it should return PhotosDto with correct values',
    () {
      PhotosDto photosDto = PhotosDto(
        id: 1,
        width: 500,
        height: 500,
        url: "https://example.com/photo.jpg",
        photographer: "John Doe",
        photographerUrl: "https://example.com/johndoe",
        photographerId: 123,
        avgColor: "#FFFFFF",
        src: SrcDto(
          original: "https://example.com/photo_original.jpg",
          large: "https://example.com/photo_large.jpg",
          medium: "https://example.com/photo_medium.jpg",
          small: "https://example.com/photo_small.jpg",
        ),
      );

      PhotosEntity photosEntity = photosDto.toEntity();

      expect(photosEntity.id, equals(photosDto.id));
      expect(photosEntity.width, equals(photosDto.width));
      expect(photosEntity.height, equals(photosDto.height));
      expect(photosEntity.url, equals(photosDto.url));
      expect(photosEntity.src?.original, equals(photosDto.src?.original));
      expect(photosEntity.src?.large, equals(photosDto.src?.large));
      expect(photosEntity.src?.medium, equals(photosDto.src?.medium));
      expect(photosEntity.src?.small, equals(photosDto.src?.small));
    },
  );
}
