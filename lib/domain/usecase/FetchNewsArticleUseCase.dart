import 'package:sample_news/data/model/Article.dart';
import 'package:sample_news/data/util/Resource.dart';
import 'package:sample_news/domain/repository/NewsRepository.dart';

class FetchNewsArticleUseCase {
  final NewsRepository newsRepository;

  FetchNewsArticleUseCase(this.newsRepository);

  Future<Resource<List<Article>>> execute() async {
    return newsRepository.getNewsArticle();
  }
}