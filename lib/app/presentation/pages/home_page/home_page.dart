import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_tour/app/presentation/bloc/category_bloc.dart';
import 'package:neo_tour/app/presentation/pages/home_page/widgets/my_grid.dart';
import 'package:neo_tour/app/presentation/pages/home_page/widgets/my_page.dart';
import 'package:neo_tour/core/constants/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(const GetCategory());
    super.initState();
  }

  final _pageController =
      PageController(keepPage: false, viewportFraction: 0.86);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(
      length: 7,
      vsync: this,
    );
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Discover'),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CategoryDone) {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    tabBar(tabController, state),
                    const SizedBox(height: 24),
                    MyPage(
                      tours: state.tours ?? [],
                      controller: _pageController,
                    ),
                    const SizedBox(height: 16),
                    myIndicator(state),
                    const SizedBox(height: 22),
                    recommendedText(theme),
                    const SizedBox(height: 18),
                    MyGrid(
                      tours: state.recommendedTours ?? [],
                    ),
                  ],
                ),
              ),
            );
          }
          if (state is CategoryError) {
            return const Center(
              child: Text('something went wrong'),
            );
          }
          return const Text('');
        },
      ),
    );
  }

  TabBar tabBar(TabController tabController, CategoryDone state) {
    return TabBar(
      onTap: (value) => _onTab(
        value,
      ),
      isScrollable: true,
      controller: tabController,
      tabs: List<Widget>.generate(
        7,
        (index) => Tab(text: state.categories?[index + 1].name),
      ),
    );
  }

  Padding myIndicator(CategoryDone state) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SmoothPageIndicator(
        controller: _pageController,
        count: state.tours?.length ?? 5,
        effect: const ExpandingDotsEffect(
            radius: 3,
            dotHeight: 6,
            dotWidth: 6,
            spacing: 4,
            activeDotColor: AppColors.purple2,
            dotColor: AppColors.purple3),
      ),
    );
  }

  Row recommendedText(TextTheme theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Recommended',
          style: theme.labelMedium?.copyWith(color: Colors.black),
        ),
      ],
    );
  }

  void _onTab(int value) {
    BlocProvider.of<CategoryBloc>(context).add(GetTours(value + 2));
  }
}
