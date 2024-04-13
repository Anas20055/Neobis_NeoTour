import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:neo_tour/app/domain/entity/category.dart';
import 'package:neo_tour/app/domain/usecases/get_categories.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  CategoryBloc(this._getCategoriesUseCase) : super(const CategoryLoading()) {
    on<GetCategory>(onGetEpisode);
  }
  void onGetEpisode(GetCategory event, Emitter<CategoryState> emit) async {
    try {
      final dataState = await _getCategoriesUseCase.call();
      emit(CategoryDone(dataState));
    } on DioException catch (e) {
      emit(CategoryError(e));
    }
  }
}
