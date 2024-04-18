// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:neo_tour/app/domain/entity/tour.dart';
import 'package:neo_tour/app/domain/repository/category_repo.dart';
import 'package:neo_tour/core/usecase/usecase.dart';

class GetToursUseCase implements UseCases<List<TourEntity>, String> {
  final CategoryRepo _categoryRepo;
  GetToursUseCase(
    this._categoryRepo,
  );

  @override
  Future<List<TourEntity>> call({String? params}) {
    return _categoryRepo.getTours(params);
  }
}
