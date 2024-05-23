import 'package:bloc/bloc.dart';
import 'package:sample_news/data/util/Resource.dart';
import 'package:sample_news/domain/usecase/FetchNewsArticleUseCase.dart';
import 'HomeEvent.dart';
import 'HomeState.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchNewsArticleUseCase fetchNewsArticleUseCase;

  HomeBloc(this.fetchNewsArticleUseCase) : super(const ArticleLoading()) {
    on<GetArticles>(getArticles);
  }

  void getArticles(GetArticles event, Emitter<HomeState> emit) async {
    final result = await fetchNewsArticleUseCase.execute();

    if (result is Success && result.data != null) {
      emit(ArticleDone(result.data!));
    }

    if (result is Error) {
      emit(ArticleError(result.message!));
    }
  }
}