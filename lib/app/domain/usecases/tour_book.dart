import 'package:neo_tour/app/domain/entity/post.dart';
import 'package:neo_tour/app/domain/repository/category_repo.dart';
import 'package:neo_tour/core/usecase/usecase.dart';

class TourBookUseCase implements UseCases<void, PostRequest> {
  final CategoryRepo _categoryRepo;
  TourBookUseCase(
    this._categoryRepo,
  );

  @override
  Future<void> call({PostRequest? params}) {
    return _categoryRepo.bookTour(params!);
  }
}
