import 'package:sample_news/data/model/ArticleModel.dart';
import 'package:sample_news/domain/repository/NewsRepository.dart';

class DeleteNewsArticleUseCase {
  final NewsRepository newsRepository;

  DeleteNewsArticleUseCase(this.newsRepository);

  void execute(ArticleModel article) {
    newsRepository.deleteArticle(article);
  }
}