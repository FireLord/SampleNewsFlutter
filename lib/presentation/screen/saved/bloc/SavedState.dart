import 'package:equatable/equatable.dart';
import '../../../../data/model/ArticleModel.dart';

abstract class SavedState extends Equatable {
  final List<ArticleModel>? articles;
  final String? message;

  const SavedState({this.articles, this.message});

  @override
  List<Object> get props => [articles ?? [], message ?? ''];
}

class ArticleLoading extends SavedState {
  const ArticleLoading();
}

class ArticleDone extends SavedState {
  const ArticleDone(List<ArticleModel> articles) : super(articles: articles);
}

class ArticleError extends SavedState {
  const ArticleError(String message) : super(message: message);
}