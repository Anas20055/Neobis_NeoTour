// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:neo_tour/app/data/data_sourses/neo_tour_api.dart';
import 'package:neo_tour/app/domain/entity/category.dart';
import 'package:neo_tour/app/domain/repository/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  final NeoTourApi _neoTourApi;
  CategoryRepoImpl(
    this._neoTourApi,
  );
  @override
  Future<List<CategoryEntity>> getCategories() async {
    final httpResponse = await _neoTourApi.getCategories();
    return httpResponse.data;
  }
}
