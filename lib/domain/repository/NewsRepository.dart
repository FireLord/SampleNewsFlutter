import 'package:sample_news/data/model/ArticleModel.dart';
import 'package:sample_news/data/util/Resource.dart';

abstract class NewsRepository {
  Future<Resource<List<ArticleModel>>> getNewsArticle();
  Future<List<ArticleModel>> getSavedArticle();
  void saveArticle(ArticleModel article);
  void deleteArticle(ArticleModel article);
}