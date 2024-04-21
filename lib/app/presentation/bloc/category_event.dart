part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  final int? id;
  const CategoryEvent({this.id = 1});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetCategory extends CategoryEvent {
  const GetCategory();
}

class GetTours extends CategoryEvent {
  const GetTours(int id) : super(id: id);
}

class GetRevies extends CategoryEvent {
  const GetRevies(int id) : super(id: id);
}
