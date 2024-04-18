import 'package:flutter/material.dart';
import 'package:neo_tour/app/domain/entity/tour.dart';

class DetailScreen extends StatefulWidget {
  final TourEntity tour;
  const DetailScreen({
    super.key,
    required this.tour,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(),
    );
  }
}
