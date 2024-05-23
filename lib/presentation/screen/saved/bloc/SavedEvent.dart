import 'package:equatable/equatable.dart';
import 'package:sample_news/data/model/ArticleModel.dart';

abstract class SavedEvent extends Equatable {
  final ArticleModel? article;
  const SavedEvent({this.article});

  @override
  List<Object?> get props => [article!];
}

class GetSavedArticles extends SavedEvent {
  const GetSavedArticles();
}

class DeleteArticle extends SavedEvent {
  const DeleteArticle(ArticleModel article) : super(article: article);
}