import 'package:json_annotation/json_annotation.dart';
import 'package:photo_gallery/features/home_screen/data/models/photos_dto.dart';

part 'get_photos_dto.g.dart';

@JsonSerializable()
class GetPhotosDto {
  @JsonKey(name: "page")
  final int? page;
  @JsonKey(name: "per_page")
  final int? perPage;
  @JsonKey(name: "photos")
  final List<PhotosDto>? photos;
  @JsonKey(name: "total_results")
  final int? totalResults;
  @JsonKey(name: "next_page")
  final String? nextPage;
  @JsonKey(name: "prev_page")
  final String? prevPage;

  GetPhotosDto({
    this.page,
    this.perPage,
    this.photos,
    this.totalResults,
    this.nextPage,
    this.prevPage,
  });

  factory GetPhotosDto.fromJson(Map<String, dynamic> json) {
    return _$GetPhotosDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetPhotosDtoToJson(this);
  }
}
