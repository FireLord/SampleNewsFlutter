import 'package:sample_news/data/model/ArticleModel.dart';
import 'NewsDatabase.dart';

class NewsDao {
  final NewsDatabase newsDatabase;

  NewsDao(this.newsDatabase);

  // Get all news articles
  Future<List<ArticleModel>> getAllArticles() async {
    return newsDatabase.store.box<ArticleModel>().getAll();
  }

  // Insert news article
  void insertArticle(ArticleModel article) {
    newsDatabase.store.box<ArticleModel>().put(article);
  }

  // Delete news article
  void deleteArticle(ArticleModel article) {
    newsDatabase.store.box<ArticleModel>().remove(article.id ?? 0);
  }
}