import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/HomeBloc.dart';
import 'bloc/HomeState.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  buildBody() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (_, state) {
        if (state is ArticleLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ArticleError) {
          return const Center(
              child: Icon(Icons.refresh)
          );
        }

        if (state is ArticleDone) {
          return ListView.builder(
            itemCount: state.articles?.length,
            itemBuilder: (_, index) {
              final article = state.articles?[index];
              return ListTile(
                title: Text(article?.title ?? ""),
                subtitle: Text(article?.description ?? ""),
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
