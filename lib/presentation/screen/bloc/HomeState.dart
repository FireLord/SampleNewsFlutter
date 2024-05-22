import 'package:equatable/equatable.dart';
import 'package:sample_news/data/model/Article.dart';

abstract class HomeState extends Equatable {
  final List<Article>? articles;
  final String? message;

  const HomeState({this.articles, this.message});

  @override
  List<Object> get props => [articles ?? [], message ?? ''];
}

class ArticleLoading extends HomeState {
  const ArticleLoading();
}

class ArticleDone extends HomeState {
  const ArticleDone(List<Article> articles) : super(articles: articles);
}

class ArticleError extends HomeState {
  const ArticleError(String message) : super(message: message);
}