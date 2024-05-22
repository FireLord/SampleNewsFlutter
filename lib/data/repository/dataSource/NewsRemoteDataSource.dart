import 'package:sample_news/data/model/Article.dart';
import 'package:sample_news/data/util/Resource.dart';

abstract class NewsRemoteDataSource {
  Future<Resource<List<Article>>> getNews();
}