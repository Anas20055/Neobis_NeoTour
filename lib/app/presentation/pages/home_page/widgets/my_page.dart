import 'package:flutter/material.dart';
import 'package:neo_tour/app/domain/entity/tour.dart';
import 'package:neo_tour/core/routes/routes.dart';

class MyPage extends StatelessWidget {
  final List<TourEntity> tours;
  final PageController controller;
  const MyPage({
    super.key,
    required this.tours,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SizedBox(
      height: 254,
      width: MediaQuery.sizeOf(context).width,
      child: PageView.builder(
          padEnds: false,
          itemCount: tours.length,
          controller: controller,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Row(
              children: [
                GestureDetector(
                  onTap: () => _onTab(tours[index], context),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: 254,
                    width: 335,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(tours[index].photo ?? '')),
                        borderRadius: BorderRadius.circular(19),
                        color: Colors.black),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      height: 56,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(19),
                            bottomRight: Radius.circular(19),
                          ),
                          color: Colors.black.withOpacity(0.40)),
                      child: Text(
                        tours[index].name ?? '',
                        style: theme.labelMedium,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
              ],
            );
          }),
    );
  }

  void _onTab(TourEntity tour, BuildContext context) {
    Navigator.pushNamed(context, AppRouteNames.tour, arguments: tour);
  }
}
