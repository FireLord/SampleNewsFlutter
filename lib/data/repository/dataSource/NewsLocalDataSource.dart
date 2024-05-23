import 'package:sample_news/data/model/ArticleModel.dart';

abstract class NewsLocalDataSource {
  Future<List<ArticleModel>> getSavedArticleFromDb();
  void saveArticleToDb(ArticleModel article);
  void deleteArticleFromDb(ArticleModel article);
}