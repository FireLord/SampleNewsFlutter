import 'package:sample_news/data/model/ArticleModel.dart';
import 'package:sample_news/data/repository/dataSource/NewsLocalDataSource.dart';
import '../../db/NewsDao.dart';

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  final NewsDao newsDao;

  NewsLocalDataSourceImpl(this.newsDao);

  @override
  void deleteArticleFromDb(ArticleModel article) {
    newsDao.deleteArticle(article);
  }

  @override
  Future<List<ArticleModel>> getSavedArticleFromDb() {
    return newsDao.getAllArticles();
  }

  @override
  void saveArticleToDb(ArticleModel article) {
    newsDao.insertArticle(article);
  }
}