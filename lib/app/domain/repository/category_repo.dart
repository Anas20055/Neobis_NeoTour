import 'package:neo_tour/app/domain/entity/category.dart';
import 'package:neo_tour/app/domain/entity/post.dart';
import 'package:neo_tour/app/domain/entity/review.dart';
import 'package:neo_tour/app/domain/entity/tour.dart';

abstract class CategoryRepo {
  Future<List<CategoryEntity>> getCategories();
  Future<List<TourEntity>> getTours(String? id);
  Future<List<ReviewEntity>> getReviews(String id);
  Future<void> bookTour(PostRequest tourBook);
}
