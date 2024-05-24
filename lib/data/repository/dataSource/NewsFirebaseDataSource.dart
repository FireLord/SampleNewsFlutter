import '../../model/ArticleModel.dart';

abstract class NewsFirebaseDataSource {
  Future<List<ArticleModel>>? getSavedArticleFromFb();
  Future<bool> saveArticleToFb(ArticleModel article);
  Future<bool> deleteArticleFromFb(ArticleModel article);
}