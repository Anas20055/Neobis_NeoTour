import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_tour/app/domain/entity/tour.dart';
import 'package:neo_tour/app/presentation/bloc/category_bloc.dart';
import 'package:neo_tour/app/presentation/pages/detail_screen/widget/detail_sceen_content.dart';

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
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(GetRevies(widget.tour.id ?? 1));
    print('1');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: [
          DetailScreenContent(widget: widget),
          _buildButton(context, theme),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, TextTheme theme) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'Book Now',
            style: theme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
