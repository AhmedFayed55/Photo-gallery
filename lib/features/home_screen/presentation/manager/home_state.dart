import 'package:photo_gallery/features/home_screen/domain/entities/get_photos_entity.dart';

abstract class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeErrorState extends HomeState {
  final String errorMessage;

  HomeErrorState({required this.errorMessage});
}

final class HomeSuccessState extends HomeState {
  final List<PhotosEntity> photos;
  final bool hasMore;

  HomeSuccessState({required this.photos, required this.hasMore});
}
