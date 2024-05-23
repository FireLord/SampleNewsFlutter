import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_news/presentation/screen/saved/bloc/SavedBloc.dart';
import 'package:sample_news/presentation/screen/saved/bloc/SavedEvent.dart';
import 'package:sample_news/presentation/screen/saved/bloc/SavedState.dart';

import '../../../data/model/ArticleModel.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  buildBody() {
    return BlocBuilder<SavedBloc, SavedState>(
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
                    BlocProvider.of<SavedBloc>(context).add(
                      DeleteArticle(article!),
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
