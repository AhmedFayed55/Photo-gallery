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

  int _page = 1;
  final int _perPage = 40;
  bool _hasMore = true;
  bool _isLoading = false;
  final List<PhotosEntity> _allPhotos = [];

  void loadInitialPhotos() async {
    _page = 1;
    _allPhotos.clear();
    _hasMore = true;
    emit(HomeLoadingState());
    await getPhotos();
  }

  void loadMorePhotos() async {
    if (_isLoading || !_hasMore) return;
    _page++;
    await getPhotos();
  }

  Future<void> getPhotos() async {
    _isLoading = true;
    final result = await _useCase.invoke(page: _page, perPage: _perPage);
    _isLoading = false;

    switch (result) {
      case ApiSuccessResult<List<PhotosEntity>>():
        final newPhotos = result.data;
        _allPhotos.addAll(newPhotos);
        _hasMore = newPhotos.length >= _perPage;
        emit(HomeSuccessState(photos: _allPhotos, hasMore: _hasMore));
      case ApiErrorResult<List<PhotosEntity>>():
        emit(HomeErrorState(errorMessage: result.failure.errorMessage));
    }
  }
}

