import 'package:equatable/equatable.dart';
import '../../../../data/model/ArticleModel.dart';

abstract class HomeEvent extends Equatable {
  final ArticleModel? article;
  const HomeEvent({this.article});

  @override
  List<Object?> get props => [article!];
}

class GetArticles extends HomeEvent {
  const GetArticles();
}

class SaveArticle extends HomeEvent {
  const SaveArticle(ArticleModel article) : super(article: article);
}