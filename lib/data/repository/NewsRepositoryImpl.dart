import 'package:sample_news/data/model/ArticleModel.dart';
import 'package:sample_news/data/repository/dataSource/NewsRemoteDataSource.dart';
import 'package:sample_news/data/util/Resource.dart';
import 'package:sample_news/domain/repository/NewsRepository.dart';

import 'dataSource/NewsFirebaseDataSource.dart';
import 'dataSource/NewsLocalDataSource.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource newsRemoteDataSource;
  final NewsLocalDataSource newsLocalDataSource;
  final NewsFirebaseDataSource newsFirebaseDataSource;

  NewsRepositoryImpl(this.newsRemoteDataSource, this.newsLocalDataSource, this.newsFirebaseDataSource);

  @override
  Future<Resource<List<ArticleModel>>> getNewsArticle() {
    return newsRemoteDataSource.getNews();
  }

  @override
  Future<void> deleteArticle(ArticleModel article) async {
    final result = await newsFirebaseDataSource.deleteArticleFromFb(article);
    if (result) {
      newsLocalDataSource.deleteArticleFromDb(article);
    }
  }

  @override
  Future<List<ArticleModel>> getSavedArticle() async {
    final result = await newsLocalDataSource.getSavedArticleFromDb();
    if (result.isNotEmpty) {
      return result;
    } else {
      final result = await newsFirebaseDataSource.getSavedArticleFromFb();
      if (result != null && result.isNotEmpty) {
        for (var element in result) {
          newsLocalDataSource.saveArticleToDb(element);
        }
        return result;
      } else {
        return [];
      }
    }
  }

  @override
  void saveArticle(ArticleModel article) async {
    final result = await newsFirebaseDataSource.saveArticleToFb(article);
    if (result) {
      newsLocalDataSource.saveArticleToDb(article);
    }
  }
}