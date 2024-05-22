import 'package:sample_news/data/api/NewsAPIService.dart';
import 'package:sample_news/data/model/Article.dart';
import 'package:sample_news/data/util/Resource.dart';
import '../dataSource/NewsRemoteDataSource.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final NewsAPIService newsAPIService;

  NewsRemoteDataSourceImpl(this.newsAPIService);

  @override
  Future<Resource<List<Article>>> getNews() {
    return newsAPIService.getNews();
  }
}
