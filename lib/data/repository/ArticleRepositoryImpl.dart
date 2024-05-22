import 'package:sample_news/data/model/Article.dart';
import 'package:sample_news/data/repository/dataSource/NewsRemoteDataSource.dart';
import 'package:sample_news/data/util/Resource.dart';
import 'package:sample_news/domain/repository/NewsRepository.dart';

class ArticleRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource newsRemoteDataSource;

  ArticleRepositoryImpl(this.newsRemoteDataSource);

  @override
  Future<Resource<List<Article>>> getNewsArticle() {
    return newsRemoteDataSource.getNews();
  }
}