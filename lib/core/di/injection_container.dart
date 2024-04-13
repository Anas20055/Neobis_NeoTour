import 'package:get_it/get_it.dart';

import 'package:dio/dio.dart';
import 'package:neo_tour/app/data/data_sourses/neo_tour_api.dart';
import 'package:neo_tour/app/data/repository/category_repo_impl.dart';
import 'package:neo_tour/app/domain/repository/category_repo.dart';
import 'package:neo_tour/app/domain/usecases/get_categories.dart';
import 'package:neo_tour/app/presentation/bloc/category_bloc.dart';
import 'package:neo_tour/core/constants/constats.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

part "dio_client.dart";

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = _buildDioClient(Constnats.baseUrl);
  sl.registerSingleton<NeoTourApi>(NeoTourApi(dio));
  sl.registerSingleton<CategoryRepo>(CategoryRepoImpl(sl()));
  sl.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase(sl()));
  sl.registerSingleton<CategoryBloc>(CategoryBloc(sl()));
}
