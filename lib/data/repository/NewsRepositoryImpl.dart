import 'package:sample_news/data/model/ArticleModel.dart';
import 'package:sample_news/data/repository/dataSource/NewsRemoteDataSource.dart';
import 'package:sample_news/data/util/Resource.dart';
import 'package:sample_news/domain/repository/NewsRepository.dart';

import 'dataSource/NewsLocalDataSource.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource newsRemoteDataSource;
  final NewsLocalDataSource newsLocalDataSource;

  NewsRepositoryImpl(this.newsRemoteDataSource, this.newsLocalDataSource);

  @override
  Future<Resource<List<ArticleModel>>> getNewsArticle() {
    return newsRemoteDataSource.getNews();
  }

  @override
  void deleteArticle(ArticleModel article) {
    newsLocalDataSource.deleteArticleFromDb(article);
  }

  @override
  Future<List<ArticleModel>> getSavedArticle() {
    return newsLocalDataSource.getSavedArticleFromDb();
  }

  @override
  void saveArticle(ArticleModel article) {
    newsLocalDataSource.saveArticleToDb(article);
  }
}