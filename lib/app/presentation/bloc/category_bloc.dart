import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:neo_tour/app/domain/entity/category.dart';
import 'package:neo_tour/app/domain/entity/tour.dart';
import 'package:neo_tour/app/domain/entity/review.dart';
import 'package:neo_tour/app/domain/usecases/get_categories.dart';
import 'package:neo_tour/app/domain/usecases/get_reviews.dart';
import 'package:neo_tour/app/domain/usecases/get_tours.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetToursUseCase _getToursUseCase;
  final GetReviewsUseCase _getReviewsUseCase;
  CategoryBloc(
    this._getCategoriesUseCase,
    this._getToursUseCase,
    this._getReviewsUseCase,
  ) : super(const CategoryLoading()) {
    on<GetCategory>(onGetCategory);
    on<GetTours>(onGetTours);
    on<GetRevies>(onGetReviews);
  }
  void onGetCategory(GetCategory event, Emitter<CategoryState> emit) async {
    emit(const CategoryLoading());
    try {
      final dataState = await _getCategoriesUseCase.call();
      final dataState2 = await _getToursUseCase.call(params: '2');
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
      emit(CategoryDone(
          tours: dataState,
          categories: currentState.categories,
          recommendedTours: currentState.recommendedTours));
    } on DioException catch (e) {
      emit(CategoryError(e));
    }
  }

  void onGetReviews(GetRevies event, Emitter<CategoryState> emit) async {
    try {
      final currentState = state;
      final dataState =
          await _getReviewsUseCase.call(params: event.id.toString());
      emit(CategoryDone(
          tours: currentState.tours,
          categories: currentState.categories,
          recommendedTours: currentState.recommendedTours,
          reviews: dataState));
    } on DioException catch (e) {
      emit(CategoryError(e));
    }
  }
}
