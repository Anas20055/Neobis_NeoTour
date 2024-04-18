part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  final List<CategoryEntity>? categories;
  final List<TourEntity>? tours;
  final List<TourEntity>? recommendedTours;
  final DioException? error;

  const CategoryState(
      {this.categories, this.error, this.tours, this.recommendedTours});

  @override
  List<Object> get props =>
      [categories ?? '', error ?? '', tours ?? <TourEntity>[]];
}

class CategoryLoading extends CategoryState {
  const CategoryLoading();
}

class CategoryDone extends CategoryState {
  const CategoryDone({super.categories, super.tours, super.recommendedTours});
}

class CategoryError extends CategoryState {
  const CategoryError(DioException error) : super(error: error);
}
