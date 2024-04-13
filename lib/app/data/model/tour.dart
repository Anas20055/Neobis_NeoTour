import 'package:json_annotation/json_annotation.dart';
import 'package:neo_tour/app/domain/entity/tour.dart';

part 'tour.g.dart';

@JsonSerializable()
class TourModel extends TourEntity {
  const TourModel({
    super.id,
    super.name,
    super.photo,
    super.description,
    super.location,
  });
  factory TourModel.fromJson(Map<String, dynamic> json) =>
      _$TourModelFromJson(json);

  Map<String, dynamic> toJson() => _$TourModelToJson(this);
}
