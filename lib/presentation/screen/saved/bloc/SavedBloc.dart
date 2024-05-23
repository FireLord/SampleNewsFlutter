import 'package:bloc/bloc.dart';
import '/domain/usecase/DeleteNewsArticleUseCase.dart';
import '/domain/usecase/GetSavedNewsArticleUseCase.dart';
import 'SavedEvent.dart';
import 'SavedState.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final GetSavedNewsArticleUseCase getSavedNewsArticleUseCase;
  final DeleteNewsArticleUseCase deleteArticleUseCase;

  SavedBloc(this.getSavedNewsArticleUseCase, this.deleteArticleUseCase)
      : super(const ArticleLoading()) {
    on<GetSavedArticles>(onGetSavedArticles);
    on<DeleteArticle>(onDeleteArticle);
  }

  void onGetSavedArticles(
      GetSavedArticles event, Emitter<SavedState> emit) async {
    final result = await getSavedNewsArticleUseCase.execute();

    if (result.isNotEmpty) {
      emit(ArticleDone(result));
    }

    if (result.isEmpty) {
      emit(const ArticleError("Empty list"));
    }
  }

  void onDeleteArticle(DeleteArticle event, Emitter<SavedState> emit) async {
    try {
      deleteArticleUseCase.execute(event.article!);
      final result = await getSavedNewsArticleUseCase.execute();

      if (result.isNotEmpty) {
        emit(ArticleDone(result));
      }

      if (result.isEmpty) {
        emit(const ArticleError("Empty list"));
      }
    } catch (e) {
      emit(ArticleError(e.toString()));
    }
  }
}
