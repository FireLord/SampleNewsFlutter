import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:sample_news/data/model/ArticleModel.dart';
import 'package:sample_news/data/util/Resource.dart';
import 'package:sample_news/domain/usecase/FetchNewsArticleUseCase.dart';
import '../../../../domain/usecase/DeleteNewsArticleUseCase.dart';
import '../../../../domain/usecase/SaveNewsArticleUseCase.dart';
import 'HomeEvent.dart';
import 'HomeState.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchNewsArticleUseCase fetchNewsArticleUseCase;
  final SaveNewsArticleUseCase saveNewsArticleUseCase;

  HomeBloc(
    this.fetchNewsArticleUseCase,
    this.saveNewsArticleUseCase,
  ) : super(const ArticleLoading()) {
    on<GetArticles>(onGetArticles);
    on<SaveArticle>(onSaveArticle);
  }

  void onGetArticles(GetArticles event, Emitter<HomeState> emit) async {
    final result = await fetchNewsArticleUseCase.execute();

    if (result is Success && result.data != null) {
      emit(ArticleDone(result.data!));
    }

    if (result is Error) {
      emit(ArticleError(result.message!));
    }
  }

  void onSaveArticle(SaveArticle event, Emitter<HomeState> emit) {
    try {
      saveNewsArticleUseCase.execute(event.article!);
    } catch (e) {
      emit(ArticleError(e.toString()));
    }
  }
}
