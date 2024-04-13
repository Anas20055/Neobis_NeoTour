import 'package:neo_tour/app/domain/entity/category.dart';

abstract class CategoryRepo {
  Future<List<CategoryEntity>> getCategories();
}
