import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_gallery/features/home_screen/domain/entities/get_photos_entity.dart';
import 'package:photo_gallery/features/home_screen/domain/use_cases/get_photos_use_case.dart';
import 'package:photo_gallery/features/home_screen/presentation/manager/home_state.dart';

import '../../../../core/network/api_result.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._useCase) : super(HomeInitialState());

  final GetPhotosUseCase _useCase;

  Future<void> getPhotos() async {
    emit(HomeLoadingState());
    final result = await _useCase.invoke();
    switch (result) {
      case ApiSuccessResult<List<PhotosEntity>>():
        emit(HomeSuccessState(photos: result.data));
      case ApiErrorResult<List<PhotosEntity>>():
        emit(HomeErrorState(errorMessage: result.failure.errorMessage));
    }
  }
}
