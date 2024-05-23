import '../../data/model/ArticleModel.dart';
import '../repository/NewsRepository.dart';

class SaveNewsArticleUseCase {
  final NewsRepository newsRepository;

  SaveNewsArticleUseCase(this.newsRepository);

  void execute(ArticleModel article) {
    newsRepository.saveArticle(article);
  }
}