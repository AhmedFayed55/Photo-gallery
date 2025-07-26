import 'package:hive/hive.dart';
import 'package:photo_gallery/features/home_screen/data/models/hive_models/src_hive_dto.dart';
import 'package:photo_gallery/features/home_screen/domain/entities/get_photos_entity.dart';

part 'photos_hive_dto.g.dart';

@HiveType(typeId: 2)
class PhotosHiveDto {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final int? width;

  @HiveField(2)
  final int? height;

  @HiveField(3)
  final String? url;

  @HiveField(4)
  final String? photographer;

  @HiveField(5)
  final String? photographerUrl;

  @HiveField(6)
  final int? photographerId;

  @HiveField(7)
  final String? avgColor;

  @HiveField(8)
  final SrcHiveDto? src;

  @HiveField(9)
  final bool? liked;

  @HiveField(10)
  final String? alt;

  PhotosHiveDto({
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

  PhotosEntity toEntity() {
    return PhotosEntity(
      id: id,
      width: width,
      height: height,
      url: url,
      src: src?.toEntity(),
    );
  }
}
