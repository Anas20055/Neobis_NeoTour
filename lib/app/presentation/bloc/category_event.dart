part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetCategory extends CategoryEvent {
  const GetCategory();
}
