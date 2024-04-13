import 'package:equatable/equatable.dart';
import 'package:neo_tour/app/domain/entity/tour.dart';

class CategoryEntity extends Equatable {
  final int? id;
  final String? name;
  final List<TourEntity>? tours;
  const CategoryEntity({
    required this.id,
    required this.name,
    required this.tours,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        tours,
      ];
}
