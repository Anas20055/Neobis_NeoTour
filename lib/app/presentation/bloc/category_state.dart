part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  final List<CategoryEntity>? categories;
  final List<TourEntity>? tours;
  final List<ReviewEntity>? reviews;
  final List<TourEntity>? recommendedTours;
  final DioException? error;

  const CategoryState({
    this.reviews,
    this.categories,
    this.error,
    this.tours,
    this.recommendedTours,
  });

  @override
  List<Object> get props =>
      [categories ?? [], error ?? '', tours ?? [], reviews ?? []];
}

class CategoryLoading extends CategoryState {
  const CategoryLoading();
}

class CategoryDone extends CategoryState {
  const CategoryDone({
    super.categories,
    super.tours,
    super.recommendedTours,
    super.reviews,
  });
}

class CategoryError extends CategoryState {
  const CategoryError(DioException error) : super(error: error);
}
