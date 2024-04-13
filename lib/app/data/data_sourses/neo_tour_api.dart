import 'package:dio/dio.dart';
import 'package:neo_tour/app/data/model/category.dart';
import 'package:neo_tour/core/constants/constats.dart';
import 'package:retrofit/retrofit.dart';

part 'neo_tour_api.g.dart';

@RestApi(baseUrl: Constnats.baseUrl)
abstract class NeoTourApi {
  factory NeoTourApi(Dio dio) = _NeoTourApi;
  @GET('/neotour/categories')
  Future<HttpResponse<List<CategoryModel>>> getCategories();
}
