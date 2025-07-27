import 'package:flutter_test/flutter_test.dart';
import 'package:photo_gallery/features/home_screen/data/models/get_photos_dto.dart';
import 'package:photo_gallery/features/home_screen/data/models/mapers/maper.dart';
import 'package:photo_gallery/features/home_screen/data/models/photos_dto.dart';
import 'package:photo_gallery/features/home_screen/data/models/src_dto.dart';

void main() {
  group("toGetPhotosHiveDto", () {
    test(
      'when call toGetPhotosHiveDto with null values it should return GetPhotosHiveDto with null values',
      () {
        GetPhotosDto getPhotosDto = GetPhotosDto(
          page: null,
          perPage: null,
          photos: null,
          totalResults: null,
          nextPage: null,
          prevPage: null,
        );

        final actualResult = toGetPhotosHiveDto(getPhotosDto);

        expect(actualResult.page, null);
        expect(actualResult.perPage, null);
        expect(actualResult.photos, null);
        expect(actualResult.totalResults, null);
        expect(actualResult.nextPage, null);
        expect(actualResult.prevPage, null);
      },
    );

    test(
      'when call toGetPhotosHiveDto with non-null values it should return GetphotosHiveDto with correct values',
      () {
        GetPhotosDto getPhotosDto = GetPhotosDto(
          page: 1,
          perPage: 10,
          photos: [],
          totalResults: 100,
          nextPage: 'next_page_url',
          prevPage: 'prev_page_url',
        );

        final actualResult = toGetPhotosHiveDto(getPhotosDto);

        expect(actualResult.page, actualResult.page);
        expect(actualResult.perPage, actualResult.perPage);
        expect(actualResult.photos, isNotNull);
        expect(actualResult.totalResults, actualResult.totalResults);
        expect(actualResult.nextPage, actualResult.nextPage);
        expect(actualResult.prevPage, actualResult.prevPage);
      },
    );
  });

  group("toPhotosHiveDto", () {
    test(
      'when call toPhotosHiveDto with null values it should return PhotosHiveDto with null values',
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

        final actualResult = toPhotosHiveDto(photosDto);

        expect(actualResult.id, null);
        expect(actualResult.width, null);
        expect(actualResult.height, null);
        expect(actualResult.url, null);
        expect(actualResult.photographer, null);
        expect(actualResult.photographerUrl, null);
        expect(actualResult.photographerId, null);
        expect(actualResult.avgColor, null);
        expect(actualResult.src, null);
        expect(actualResult.liked, null);
        expect(actualResult.alt, null);
      },
    );

    test(
      'when call toPhotosHiveDto with non-null values it should return PhotosHiveDto with correct values',
      () {
        PhotosDto photosDto = PhotosDto(
          id: 1,
          width: 1920,
          height: 1080,
          url: 'https://example.com/photo.jpg',
          photographer: 'John Doe',
          photographerUrl: 'https://example.com/johndoe',
          photographerId: 123,
          avgColor: '#FFFFFF',
          src: SrcDto(
            original: 'https://example.com/original.jpg',
            large2x: 'https://example.com/large2x.jpg',
            large: 'https://example.com/large.jpg',
            medium: 'https://example.com/medium.jpg',
            small: 'https://example.com/small.jpg',
            portrait: 'https://example.com/portrait.jpg',
            landscape: 'https://example.com/landscape.jpg',
            tiny: 'https://example.com/tiny.jpg',
          ),
          liked: true,
          alt: 'A beautiful scenery',
        );

        final actualResult = toPhotosHiveDto(photosDto);

        expect(actualResult.id, photosDto.id);
        expect(actualResult.width, photosDto.width);
        expect(actualResult.height, photosDto.height);
        expect(actualResult.url, photosDto.url);
        expect(actualResult.photographer, photosDto.photographer);
        expect(actualResult.photographerUrl, photosDto.photographerUrl);
        expect(actualResult.photographerId, photosDto.photographerId);
        expect(actualResult.avgColor, photosDto.avgColor);
        expect(actualResult.src?.original, photosDto.src?.original);
        expect(actualResult.src?.large2x, photosDto.src?.large2x);
        expect(actualResult.src?.large, photosDto.src?.large);
        expect(actualResult.src?.medium, photosDto.src?.medium);
        expect(actualResult.src?.small, photosDto.src?.small);
        expect(actualResult.src?.portrait, photosDto.src?.portrait);
        expect(actualResult.src?.landscape, photosDto.src?.landscape);
        expect(actualResult.src?.tiny, photosDto.src?.tiny);
        expect(actualResult.liked, photosDto.liked);
        expect(actualResult.alt, photosDto.alt);
      },
    );
  });

  group("toSrcHiveDto", () {
    test(
      "when call toSrcHiveDto with null values it should return SrcHiveDto with null values",
      () {
        SrcDto srcDto = SrcDto(
          original: null,
          large2x: null,
          large: null,
          medium: null,
          small: null,
          portrait: null,
          landscape: null,
          tiny: null,
        );

        final actualResult = toSrcHiveDto(srcDto);

        expect(actualResult?.original, null);
        expect(actualResult?.large2x, null);
        expect(actualResult?.large, null);
        expect(actualResult?.medium, null);
        expect(actualResult?.small, null);
        expect(actualResult?.portrait, null);
        expect(actualResult?.landscape, null);
        expect(actualResult?.tiny, null);
      },
    );

    test(
      "when call toSrcHiveDto with non-null values it should return SrcHiveDto with correct values",
      () {
        SrcDto srcDto = SrcDto(
          original: 'https://example.com/original.jpg',
          large2x: 'https://example.com/large2x.jpg',
          large: 'https://example.com/large.jpg',
          medium: 'https://example.com/medium.jpg',
          small: 'https://example.com/small.jpg',
          portrait: 'https://example.com/portrait.jpg',
          landscape: 'https://example.com/landscape.jpg',
          tiny: 'https://example.com/tiny.jpg',
        );

        final actualResult = toSrcHiveDto(srcDto);

        expect(actualResult?.original, srcDto.original);
        expect(actualResult?.large2x, srcDto.large2x);
        expect(actualResult?.large, srcDto.large);
        expect(actualResult?.medium, srcDto.medium);
        expect(actualResult?.small, srcDto.small);
        expect(actualResult?.portrait, srcDto.portrait);
        expect(actualResult?.landscape, srcDto.landscape);
        expect(actualResult?.tiny, srcDto.tiny);
      },
    );
  });
}
