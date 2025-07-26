import '../get_photos_dto.dart';
import '../hive_models/get_photos_hive_dto.dart';
import '../hive_models/photos_hive_dto.dart';
import '../hive_models/src_hive_dto.dart';
import '../photos_dto.dart';
import '../src_dto.dart';

GetPhotosHiveDto toGetPhotosHiveDto(GetPhotosDto dto) {
  return GetPhotosHiveDto(
    page: dto.page,
    perPage: dto.perPage,
    photos: dto.photos?.map((photo) => toPhotosHiveDto(photo)).toList(),
    totalResults: dto.totalResults,
    nextPage: dto.nextPage,
    prevPage: dto.prevPage,
  );
}

PhotosHiveDto toPhotosHiveDto(PhotosDto dto) {
  return PhotosHiveDto(
    id: dto.id,
    width: dto.width,
    height: dto.height,
    url: dto.url,
    photographer: dto.photographer,
    photographerUrl: dto.photographerUrl,
    photographerId: dto.photographerId,
    avgColor: dto.avgColor,
    src: toSrcHiveDto(dto.src),
    liked: dto.liked,
    alt: dto.alt,
  );
}

SrcHiveDto? toSrcHiveDto(SrcDto? dto) {
  if (dto == null) return null;
  return SrcHiveDto(
    original: dto.original,
    large2x: dto.large2x,
    large: dto.large,
    medium: dto.medium,
    small: dto.small,
    portrait: dto.portrait,
    landscape: dto.landscape,
    tiny: dto.tiny,
  );
}
