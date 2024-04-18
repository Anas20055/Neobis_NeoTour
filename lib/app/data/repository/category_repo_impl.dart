// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:neo_tour/app/data/data_sourses/neo_tour_api.dart';
import 'package:neo_tour/app/data/model/category.dart';
import 'package:neo_tour/app/domain/entity/tour.dart';
import 'package:neo_tour/app/domain/repository/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  final NeoTourApi _neoTourApi;
  CategoryRepoImpl(
    this._neoTourApi,
  );
  @override
  Future<List<CategoryModel>> getCategories() async {
    final httpResponse = await _neoTourApi.getCategories();
    return httpResponse.data;
  }

  @override
  Future<List<TourEntity>> getTours(String? id) async {
    final httpResponse = await _neoTourApi.getTours(id);
    return httpResponse.data;
  }
}
