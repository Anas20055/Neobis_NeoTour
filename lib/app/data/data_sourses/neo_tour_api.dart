import 'package:dio/dio.dart';
import 'package:neo_tour/app/data/model/category.dart';
import 'package:neo_tour/app/data/model/review.dart';
import 'package:neo_tour/app/data/model/tour.dart';
import 'package:neo_tour/app/domain/entity/post.dart';
import 'package:neo_tour/core/constants/constats.dart';
import 'package:retrofit/retrofit.dart';

part 'neo_tour_api.g.dart';

@RestApi(baseUrl: Constnats.baseUrl)
abstract class NeoTourApi {
  factory NeoTourApi(Dio dio) = _NeoTourApi;
  @GET('/categories')
  Future<HttpResponse<List<CategoryModel>>> getCategories();

  @GET('/tours')
  Future<HttpResponse<List<TourModel>>> getTours(
      @Query("category_id") String? id);

  @GET('/reviews')
  Future<HttpResponse<List<ReviewModel>>> getReviews(
      @Query("tour_id") String? id);

  @POST("/tour-book")
  Future<void> createPost(@Body() PostRequest postRequest);
}
