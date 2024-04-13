import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neo_tour/core/constants/app_images.dart';
import 'package:neo_tour/core/constants/app_svg.dart';
import 'package:neo_tour/core/routes/routes.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppImages.onBoardingImage),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Winter\nVacation Trips',
                  style: theme.labelLarge,
                ),
                const SizedBox(height: 12),
                Text(
                  'Enjoy your winter vacations with warmth \nand amazing sightseeing on the mountains.\nEnjoy the best experience with us!',
                  style: theme.labelSmall,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _onPressed,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Let’s Go!',
                        style: theme.labelSmall?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(width: 19),
                      SvgPicture.asset(AppSvg.arrow),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onPressed() {
    Navigator.pushNamed(context, AppRouteNames.homePage);
  }
}
