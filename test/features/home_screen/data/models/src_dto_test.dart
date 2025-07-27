import 'package:flutter_test/flutter_test.dart';
import 'package:photo_gallery/features/home_screen/data/models/src_dto.dart';

void main() {
  test(
    'when call toEntity with nullable values it should return SrcDto with null values',
    () {
      SrcDto srcDto = SrcDto(
        original: null,
        large: null,
        medium: null,
        small: null,
      );

      expect(srcDto.original, isNull);
      expect(srcDto.large, isNull);
      expect(srcDto.medium, isNull);
      expect(srcDto.small, isNull);
    },
  );

  test(
    'when call toEntity with non-null values it should return SrcDto with correct values',
    () {
      SrcDto srcDto = SrcDto(
        original: "https://example.com/photo_original.jpg",
        large: "https://example.com/photo_large.jpg",
        medium: "https://example.com/photo_medium.jpg",
        small: "https://example.com/photo_small.jpg",
      );

      expect(srcDto.original, equals(srcDto.original));
      expect(srcDto.large, equals(srcDto.large));
      expect(srcDto.medium, equals(srcDto.medium));
      expect(srcDto.small, equals(srcDto.small));
    },
  );
}
