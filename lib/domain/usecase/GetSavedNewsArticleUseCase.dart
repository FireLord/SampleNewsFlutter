import 'package:sample_news/data/model/ArticleModel.dart';
import '../repository/NewsRepository.dart';

class GetSavedNewsArticleUseCase {
  final NewsRepository newsRepository;

  GetSavedNewsArticleUseCase(this.newsRepository);

  Future<List<ArticleModel>> execute() {
    return newsRepository.getSavedArticle();
  }
}