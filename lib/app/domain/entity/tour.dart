// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TourEntity extends Equatable {
  final int? id;
  final String? name;
  final String? photo;
  final String? description;
  final String? location;
  const TourEntity({
    required this.id,
    required this.name,
    required this.photo,
    required this.description,
    required this.location,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        photo,
        description,
        location,
      ];
}
