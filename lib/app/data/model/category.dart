import 'package:json_annotation/json_annotation.dart';
import 'package:neo_tour/app/data/model/tour.dart';
import 'package:neo_tour/app/domain/entity/category.dart';

@JsonSerializable()
class CategoryModel extends CategoryEntity {
  const CategoryModel({
    super.id,
    super.name,
    List<TourModel>? super.tours,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      tours: (json['tours'] as List<dynamic>)
          .map((json) => TourModel.fromJson(json))
          .toList(),
    );
  }
}
