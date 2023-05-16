import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampleia/home/bloc/home_bloc.dart';
import '../data/repository/home_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(
        create: (context) => HomeRepositoryImpl(),
        child: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(RepositoryProvider.of<HomeRepositoryImpl>(context))
            ..add(FetchRecommended()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Recommended List'),
          centerTitle: true,
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            //Loading State
            if (state is RecommendedLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            //Success State
            if (state is RecommendedSuccess) {
              return Center(
                child: Text(state.recommended[0].charityName),
              );
            }
            //Error State
            if (state is RecommendedError) {
              return Center(
                child: Text("Error:${state.error}"),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
