import 'package:hive/hive.dart';
import 'package:photo_gallery/features/home_screen/domain/entities/get_photos_entity.dart';

part 'src_hive_dto.g.dart';

@HiveType(typeId: 3)
class SrcHiveDto {
  @HiveField(0)
  final String? original;

  @HiveField(1)
  final String? large2x;

  @HiveField(2)
  final String? large;

  @HiveField(3)
  final String? medium;

  @HiveField(4)
  final String? small;

  @HiveField(5)
  final String? portrait;

  @HiveField(6)
  final String? landscape;

  @HiveField(7)
  final String? tiny;

  SrcHiveDto({
    this.original,
    this.large2x,
    this.large,
    this.medium,
    this.small,
    this.portrait,
    this.landscape,
    this.tiny,
  });

  SrcEntity toEntity() {
    return SrcEntity(
      original: original,
      large2x: large2x,
      large: large,
      medium: medium,
      small: small,
      portrait: portrait,
      landscape: landscape,
      tiny: tiny,
    );
  }
}
