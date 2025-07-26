import 'package:json_annotation/json_annotation.dart';
import 'package:photo_gallery/features/home_screen/data/models/src_dto.dart';
import 'package:photo_gallery/features/home_screen/domain/entities/get_photos_entity.dart';

part 'photos_dto.g.dart';

@JsonSerializable()
class PhotosDto {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "width")
  final int? width;
  @JsonKey(name: "height")
  final int? height;
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "photographer")
  final String? photographer;
  @JsonKey(name: "photographer_url")
  final String? photographerUrl;
  @JsonKey(name: "photographer_id")
  final int? photographerId;
  @JsonKey(name: "avg_color")
  final String? avgColor;
  @JsonKey(name: "src")
  final SrcDto? src;
  @JsonKey(name: "liked")
  final bool? liked;
  @JsonKey(name: "alt")
  final String? alt;

  PhotosDto({
    this.id,
    this.width,
    this.height,
    this.url,
    this.photographer,
    this.photographerUrl,
    this.photographerId,
    this.avgColor,
    this.src,
    this.liked,
    this.alt,
  });

  factory PhotosDto.fromJson(Map<String, dynamic> json) {
    return _$PhotosDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PhotosDtoToJson(this);
  }

  PhotosEntity toEntity() {
    return PhotosEntity(
      id: id,
      width: width,
      height: height,
      url: url,
      photographer: photographer,
      photographerUrl: photographerUrl,
      photographerId: photographerId,
      avgColor: avgColor,
      src: src?.toEntity(),
      liked: liked,
      alt: alt,
    );
  }
}
