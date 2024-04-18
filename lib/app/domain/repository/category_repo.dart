import 'package:neo_tour/app/domain/entity/category.dart';
import 'package:neo_tour/app/domain/entity/tour.dart';

abstract class CategoryRepo {
  Future<List<CategoryEntity>> getCategories();
  Future<List<TourEntity>> getTours(String? id);
}
