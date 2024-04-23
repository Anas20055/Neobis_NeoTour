import 'package:neo_tour/app/domain/entity/category.dart';
import 'package:neo_tour/app/domain/entity/post.dart';
import 'package:neo_tour/app/domain/entity/review.dart';
import 'package:neo_tour/app/domain/entity/tour.dart';
import 'package:neo_tour/app/domain/repository/category_repo.dart';

class MockRepoImpl implements CategoryRepo {
  MockRepoImpl();
  @override
  Future<List<CategoryEntity>> getCategories() async {
    return const [
      CategoryEntity(id: 1, name: 'fsdfasfsf'),
      CategoryEntity(id: 2, name: 'fsdfasfsf'),
      CategoryEntity(id: 3, name: 'fsdfasfsf'),
      CategoryEntity(id: 4, name: 'fsdfasfsf'),
      CategoryEntity(id: 1, name: 'fsdfasfsf'),
      CategoryEntity(id: 2, name: 'fsdfasfsf'),
      CategoryEntity(id: 3, name: 'fsdfasfsf'),
      CategoryEntity(id: 4, name: 'fsdfasfsf'),
    ];
  }

  @override
  Future<List<TourEntity>> getTours(String? id) async {
    return const [
      TourEntity(
          id: 1,
          name: 'Honshu, Japan',
          photo:
              "https://res.cloudinary.com/dosmccelh/image/upload/v1/media/tour_photos/7918d6643e5e010ee92c558f998a4488_g0acyu",
          description:
              "Mount Fuji, a symbol of Japan's natural beauty, is a majestic peak rising above the landscapes of Honshu. As the country's highest mountain, it has inspired artists and pilgrims for centuries. Its near-perfect volcanic cone, which is snow-capped for about 5 months a year, can be seen from Tokyo on a clear day. The surrounding region, known as Fuji Five Lakes, offers stunning views, serene hot springs, and a rich cultural experience. Climbing season runs from early July to September, providing adventurers an opportunity to witness a breathtaking sunrise from the summit.",
          location: "Honshu, Japan"),
      TourEntity(
          id: 2,
          name: 'Honshu, Japan',
          photo:
              "https://res.cloudinary.com/dosmccelh/image/upload/v1/media/tour_photos/7918d6643e5e010ee92c558f998a4488_g0acyu",
          description:
              "Mount Fuji, a symbol of Japan's natural beauty, is a majestic peak rising above the landscapes of Honshu. As the country's highest mountain, it has inspired artists and pilgrims for centuries. Its near-perfect volcanic cone, which is snow-capped for about 5 months a year, can be seen from Tokyo on a clear day. The surrounding region, known as Fuji Five Lakes, offers stunning views, serene hot springs, and a rich cultural experience. Climbing season runs from early July to September, providing adventurers an opportunity to witness a breathtaking sunrise from the summit.",
          location: "Honshu, Japan"),
    ];
  }

  @override
  Future<List<ReviewEntity>> getReviews(String id) async {
    return const [
      ReviewEntity(
          id: 1,
          tourId: 1,
          author: AuthorEntity(
              id: 1,
              email: "fsfasf",
              username: "Anas",
              photo:
                  "https://res.cloudinary.com/dosmccelh/image/upload/v1/media/user_photos/fbd7c5b8-a1b0-4e62-b4ac-21d329c53589_w960_r1.778_fpx50.92_fpy45_zgjktz"),
          text: "fsafasfasfsa",
          createdAt: "fsfas",
          updatedAt: "fsafsf")
    ];
  }

  @override
  Future<void> bookTour(PostRequest tourBook) {
    // TODO: implement bookTour
    throw UnimplementedError();
  }
}
