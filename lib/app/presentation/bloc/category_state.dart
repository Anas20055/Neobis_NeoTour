part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  final List<CategoryEntity>? categories;
  final DioException? error;

  const CategoryState({this.categories, this.error});

  @override
  List<Object> get props => [
        categories ?? '',
        error ?? '',
      ];
}

class CategoryLoading extends CategoryState {
  const CategoryLoading();
}

class CategoryDone extends CategoryState {
  const CategoryDone(List<CategoryEntity> categories)
      : super(categories: categories);
}

class CategoryError extends CategoryState {
  const CategoryError(DioException error) : super(error: error);
}
