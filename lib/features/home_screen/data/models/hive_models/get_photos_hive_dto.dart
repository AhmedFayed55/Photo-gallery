import 'package:hive/hive.dart';
import 'package:photo_gallery/features/home_screen/data/models/hive_models/photos_hive_dto.dart';

part 'get_photos_hive_dto.g.dart';

@HiveType(typeId: 1)
class GetPhotosHiveDto {
  @HiveField(0)
  final int? page;

  @HiveField(1)
  final int? perPage;

  @HiveField(2)
  final List<PhotosHiveDto>? photos;

  @HiveField(3)
  final int? totalResults;

  @HiveField(4)
  final String? nextPage;

  @HiveField(5)
  final String? prevPage;

  GetPhotosHiveDto({
    this.page,
    this.perPage,
    this.photos,
    this.totalResults,
    this.nextPage,
    this.prevPage,
  });
}
