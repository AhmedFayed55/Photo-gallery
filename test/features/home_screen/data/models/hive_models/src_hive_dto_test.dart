import 'package:flutter_test/flutter_test.dart';
import 'package:photo_gallery/features/home_screen/data/models/hive_models/src_hive_dto.dart';

void main() {
  test(
    "when call toEntity with null values it should return SrcEntity with null fields",
    () {
      final srcHiveDto = SrcHiveDto(
        original: null,
        large2x: null,
        large: null,
        medium: null,
        small: null,
        portrait: null,
        landscape: null,
        tiny: null,
      );

      final actualResult = srcHiveDto.toEntity();

      expect(actualResult.original, null);
      expect(actualResult.large2x, null);
      expect(actualResult.large, null);
      expect(actualResult.medium, null);
      expect(actualResult.small, null);
      expect(actualResult.portrait, null);
      expect(actualResult.landscape, null);
      expect(actualResult.tiny, null);
    },
  );

  test(
    "when call toEntity with non-null values it should return SrcEntity with correct values",
    () {
      final srcHiveDto = SrcHiveDto(
        original: "original_url",
        large2x: "large2x_url",
        large: "large_url",
        medium: "medium_url",
        small: "small_url",
        portrait: "portrait_url",
        landscape: "landscape_url",
        tiny: "tiny_url",
      );

      final actualResult = srcHiveDto.toEntity();

      expect(actualResult.original, srcHiveDto.original);
      expect(actualResult.large2x, srcHiveDto.large2x);
      expect(actualResult.large, srcHiveDto.large);
      expect(actualResult.medium, srcHiveDto.medium);
      expect(actualResult.small, srcHiveDto.small);
      expect(actualResult.portrait, srcHiveDto.portrait);
      expect(actualResult.landscape, srcHiveDto.landscape);
      expect(actualResult.tiny, srcHiveDto.tiny);
    },
  );
}
