import 'package:neo_tour/app/domain/entity/review.dart';
import 'package:neo_tour/app/domain/repository/category_repo.dart';
import 'package:neo_tour/core/usecase/usecase.dart';

class GetReviewsUseCase implements UseCases<List<ReviewEntity>, String> {
  final CategoryRepo _categoryRepo;
  GetReviewsUseCase(
    this._categoryRepo,
  );

  @override
  Future<List<ReviewEntity>> call({String? params}) {
    return _categoryRepo.getReviews(params!);
  }
}
