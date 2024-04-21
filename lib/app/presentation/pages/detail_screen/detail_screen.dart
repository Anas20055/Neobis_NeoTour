import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neo_tour/app/domain/entity/tour.dart';
import 'package:neo_tour/app/presentation/bloc/category_bloc.dart';
import 'package:neo_tour/core/constants/app_svg.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: Stack(
          children: [
            SizedBox(
              height: 389,
              child: Image.network(
                widget.tour.photo ?? '',
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 35,
              left: 14,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppSvg.back),
                      Text(
                        'Back',
                        style: theme.labelSmall?.copyWith(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 357,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(36)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.tour.name ?? '',
                      style: theme.headlineLarge,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AppSvg.map),
                        const SizedBox(width: 8),
                        Text(
                          widget.tour.location ?? '',
                          style: theme.headlineSmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Description',
                      style: theme.headlineMedium,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.tour.description ?? '',
                      style: theme.labelSmall,
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Reviews',
                      style: theme.headlineMedium,
                    ),
                    const SizedBox(height: 16),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [Text('anas')],
                          );
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
