import 'package:json_annotation/json_annotation.dart';
import 'package:photo_gallery/features/home_screen/domain/entities/get_photos_entity.dart';

part 'src_dto.g.dart';

@JsonSerializable()
class SrcDto {
  @JsonKey(name: "original")
  final String? original;
  @JsonKey(name: "large2x")
  final String? large2x;
  @JsonKey(name: "large")
  final String? large;
  @JsonKey(name: "medium")
  final String? medium;
  @JsonKey(name: "small")
  final String? small;
  @JsonKey(name: "portrait")
  final String? portrait;
  @JsonKey(name: "landscape")
  final String? landscape;
  @JsonKey(name: "tiny")
  final String? tiny;

  SrcDto({
    this.original,
    this.large2x,
    this.large,
    this.medium,
    this.small,
    this.portrait,
    this.landscape,
    this.tiny,
  });

  factory SrcDto.fromJson(Map<String, dynamic> json) {
    return _$SrcDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SrcDtoToJson(this);
  }

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
