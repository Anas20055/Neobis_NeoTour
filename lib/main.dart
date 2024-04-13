import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_tour/app/presentation/bloc/category_bloc.dart';
import 'package:neo_tour/core/constants/app_colors.dart';
import 'package:neo_tour/core/di/injection_container.dart';
import 'package:neo_tour/core/routes/routes.dart';
part 'core/theme/theme.dart';

void main() async {
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CategoryBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouteNames.boarding,
        theme: _theme(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}
