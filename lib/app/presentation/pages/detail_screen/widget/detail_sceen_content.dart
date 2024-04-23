import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neo_tour/app/presentation/pages/detail_screen/detail_screen.dart';
import 'package:neo_tour/core/constants/app_svg.dart';

class DetailScreenContent extends StatelessWidget {
  const DetailScreenContent({
    super.key,
    required this.widget,
  });

  final DetailScreen widget;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Stack(
        children: [
          _buildPhoto(),
          _buildBackButton(context, theme),
          _buildContent(context, theme),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.only(top: 357),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          color: Colors.white,
        ),
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
            Text(
              'No Reviesw',
              style: theme.headlineMedium,
            ),
            // BlocBuilder<CategoryBloc, CategoryState>(
            //   builder: (context, state) {
            //     return ListView.builder(
            //       padding: const EdgeInsets.only(bottom: 70),
            //       physics: const NeverScrollableScrollPhysics(),
            //       shrinkWrap: true,
            //       itemCount: state.reviews
            //           ?.length, // Replace with the actual number of reviews
            //       itemBuilder: (context, index) {
            //         if (state is CategoryLoading) {
            //           return const Center(
            //             child: CircularProgressIndicator(),
            //           );
            //         }
            //         if (state is CategoryDone) {
            //           return Column(
            //             children: [
            //               Row(
            //                 children: [
            //                   CircleAvatar(
            //                     radius: 12,
            //                     backgroundImage: NetworkImage(
            //                       state.reviews?[index].author.photo ?? '',
            //                     ),
            //                   ),
            //                   const SizedBox(width: 8),
            //                   Text(
            //                     state.reviews?[index].author.username ?? '',
            //                     style: theme.labelSmall
            //                         ?.copyWith(fontWeight: FontWeight.w500),
            //                   ),
            //                 ],
            //               ),
            //               const SizedBox(height: 16),
            //               Text(
            //                 state.reviews?[index].text ?? '',
            //                 style: theme.labelSmall,
            //               ),
            //               const SizedBox(height: 16),
            //             ],
            //           );
            //         }
            //         return const Text('some thing went wrong');
            //       },
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  Positioned _buildBackButton(BuildContext context, TextTheme theme) {
    return Positioned(
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
    );
  }

  SizedBox _buildPhoto() {
    return SizedBox(
      height: 389,
      child: Image.network(
        widget.tour.photo ?? '',
        fit: BoxFit.fill,
      ),
    );
  }
}
