import 'package:sample_news/data/model/ArticleModel.dart';
import 'package:sample_news/data/util/Resource.dart';
import '../../api/NewsAPIService.dart';
import '../dataSource/NewsRemoteDataSource.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final NewsAPIService newsAPIService;

  NewsRemoteDataSourceImpl(this.newsAPIService);

  @override
  Future<Resource<List<ArticleModel>>> getNews() {
    return newsAPIService.getNews();
  }
}
