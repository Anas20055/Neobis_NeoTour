// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:neo_tour/app/domain/entity/tour.dart';
import 'package:neo_tour/core/routes/routes.dart';

class MyGrid extends StatelessWidget {
  final List<TourEntity> tours;
  const MyGrid({
    super.key,
    required this.tours,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
            ),
            itemCount: tours.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _onTab(tours[index], context),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(tours[index].photo ?? '')),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black),
                  child: Container(
                    padding: const EdgeInsets.only(top: 12, left: 12),
                    height: 41,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(19),
                          bottomRight: Radius.circular(19),
                        ),
                        color: Colors.black.withOpacity(0.40)),
                    child: Text(
                      tours[index].name ?? '',
                      style: theme.labelMedium?.copyWith(fontSize: 14),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  void _onTab(TourEntity tour, BuildContext context) {
    print('1');
    Navigator.pushNamed(context, AppRouteNames.tour, arguments: tour);
  }
}
