import 'package:get/get.dart';
import 'package:sample_news/domain/usecase/DeleteNewsArticleUseCase.dart';
import 'package:sample_news/domain/usecase/GetSavedNewsArticleUseCase.dart';
import '../../../data/model/ArticleModel.dart';

class SavedController extends GetxController {
  final GetSavedNewsArticleUseCase getSavedNewsArticleUseCase;
  final DeleteNewsArticleUseCase deleteNewsArticleUseCase;

  SavedController(
      this.getSavedNewsArticleUseCase, this.deleteNewsArticleUseCase);

  var articleList = <ArticleModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  void onGetSavedArticles() async {
    isLoading.value = true;
    final result = await getSavedNewsArticleUseCase.execute();

    if (result.isNotEmpty) {
      articleList.value = result;
    } else if (result.isEmpty) {
      errorMessage.value = "No saved articles";
    }
    isLoading.value = false;
  }

  void onDeleteArticle(ArticleModel article) {
    deleteNewsArticleUseCase.execute(article);
    onGetSavedArticles();
  }
}
