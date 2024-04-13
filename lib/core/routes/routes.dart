import 'package:flutter/material.dart';
import 'package:neo_tour/app/presentation/pages/boarding_screen/boarding_screen.dart';
import 'package:neo_tour/app/presentation/pages/home_page/home_page.dart';

abstract class AppRouteNames {
  static const boarding = '/boarding';
  static const homePage = '/';
  static const tour = '/tour';
}

abstract class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    return switch (settings.name) {
      AppRouteNames.homePage => _materialRoute(const HomePage()),
      AppRouteNames.boarding => _materialRoute(const BoardingScreen()),
      AppRouteNames.tour => _materialRoute(const BoardingScreen()),
      _ => _materialRoute(const BoardingScreen()),
    };
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
