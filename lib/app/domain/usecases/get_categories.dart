// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:neo_tour/app/domain/entity/category.dart';
import 'package:neo_tour/app/domain/repository/category_repo.dart';
import 'package:neo_tour/core/usecase/usecase.dart';

class GetCategoriesUseCase implements UseCases<List<CategoryEntity>, void> {
  final CategoryRepo _categoryRepo;
  GetCategoriesUseCase(
    this._categoryRepo,
  );

  @override
  Future<List<CategoryEntity>> call({void params}) {
    return _categoryRepo.getCategories();
  }
}
