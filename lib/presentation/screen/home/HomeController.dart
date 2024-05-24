import 'package:get/get.dart';
import 'package:sample_news/domain/usecase/FetchNewsArticleUseCase.dart';
import 'package:sample_news/domain/usecase/SaveNewsArticleUseCase.dart';

import '../../../data/model/ArticleModel.dart';
import '../../../data/util/Resource.dart';

class HomeController extends GetxController {
  final FetchNewsArticleUseCase fetchNewsArticleUseCase;
  final SaveNewsArticleUseCase saveNewsArticleUseCase;

  HomeController(this.fetchNewsArticleUseCase, this.saveNewsArticleUseCase);

  var articleList = <ArticleModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  void onGetArticles() async {
    isLoading.value = true;
    final result = await fetchNewsArticleUseCase.execute();

    if (result is Success && result.data != null) {
      articleList.value = result.data!;
    } else if (result is Error) {
      errorMessage.value = result.message!;
    }
    isLoading.value = false;
  }

  void onSaveArticle(ArticleModel article) {
    saveNewsArticleUseCase.execute(article);
  }
}