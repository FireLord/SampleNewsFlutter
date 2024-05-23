import 'package:sample_news/data/model/ArticleModel.dart';
import 'package:sample_news/data/util/Resource.dart';

abstract class NewsRemoteDataSource {
  Future<Resource<List<ArticleModel>>> getNews();
}