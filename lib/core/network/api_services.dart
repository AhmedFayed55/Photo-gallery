import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_gallery/features/home_screen/data/models/get_photos_dto.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import 'api_constants.dart';

part 'api_services.g.dart';

@RestApi()
@injectable
abstract class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;

  @GET(ApiConstants.photosEndpoint)
  Future<GetPhotosDto> getPhotos(
    @Header(ApiConstants.authorizationHeader) String key,
    @Query(ApiConstants.pageParam) int page,
    @Query(ApiConstants.perPageParam) int perPage,
  );
}
