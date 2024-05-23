import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_news/data/model/ArticleModel.dart';
import 'bloc/HomeBloc.dart';
import 'bloc/HomeEvent.dart';
import 'bloc/HomeState.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  buildBody() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
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
                trailing: IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {
                      BlocProvider.of<HomeBloc>(context).add(
                        SaveArticle(article!),
                      );
                    },
                ),
                onTap: () {
                  onArticlePressed(context, article!);
                },
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }

  void onArticlePressed(BuildContext context, ArticleModel article) {
    Navigator.pushNamed(context, '/detailScreen', arguments: article);
  }
}
