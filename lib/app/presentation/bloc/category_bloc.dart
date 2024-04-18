import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:neo_tour/app/domain/entity/category.dart';
import 'package:neo_tour/app/domain/entity/tour.dart';
import 'package:neo_tour/app/domain/usecases/get_categories.dart';
import 'package:neo_tour/app/domain/usecases/get_tours.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetToursUseCase _getToursUseCase;
  CategoryBloc(this._getCategoriesUseCase, this._getToursUseCase)
      : super(const CategoryLoading()) {
    on<GetCategory>(onGetCategory);
    on<GetTours>(onGetTours);
  }
  void onGetCategory(GetCategory event, Emitter<CategoryState> emit) async {
    emit(const CategoryLoading());
    try {
      final dataState = await _getCategoriesUseCase.call();
      final dataState2 =
          await _getToursUseCase.call(params: event.id.toString());
      final recommendedTours = await _getToursUseCase.call(params: '1');
      emit(CategoryDone(
          categories: dataState,
          recommendedTours: recommendedTours,
          tours: dataState2));
    } on DioException catch (e) {
      emit(CategoryError(e));
    }
  }

  void onGetTours(GetTours event, Emitter<CategoryState> emit) async {
    try {
      final currentState = state;
      final dataState =
          await _getToursUseCase.call(params: event.id.toString());
// Mark recommended tours as fetched
      emit(CategoryDone(
          tours: dataState,
          categories: currentState.categories,
          recommendedTours: currentState.recommendedTours));
    } on DioException catch (e) {
      emit(CategoryError(e));
    }
  }
}
