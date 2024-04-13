import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neo_tour/app/presentation/bloc/category_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(const GetCategory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Discover'),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is CategoryDone) {
            return Text('${state.categories}');
          }
          if (state is CategoryError) {
            return const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return const Text('');
        },
      ),
    );
  }
}
