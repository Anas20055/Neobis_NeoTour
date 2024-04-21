import 'package:neo_tour/app/data/data_sourses/neo_tour_api.dart';
import 'package:neo_tour/app/data/model/category.dart';
import 'package:neo_tour/app/domain/entity/review.dart';
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

  @override
  Future<List<ReviewEntity>> getReviews(String id) async {
    final httpResponse = await _neoTourApi.getReviews(id);
    return httpResponse.data;
  }
}
