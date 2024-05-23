import 'package:sample_news/data/model/ArticleModel.dart';
import 'package:sample_news/data/repository/dataSource/NewsRemoteDataSource.dart';
import 'package:sample_news/data/util/Resource.dart';
import 'package:sample_news/domain/repository/NewsRepository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource newsRemoteDataSource;

  NewsRepositoryImpl(this.newsRemoteDataSource);

  @override
  Future<Resource<List<ArticleModel>>> getNewsArticle() {
    return newsRemoteDataSource.getNews();
  }
}