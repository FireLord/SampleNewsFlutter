import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../injection_container.dart';
import '../detail/DetailScreen.dart';
import 'SavedController.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  buildBody() {
    final SavedController savedController = sl<SavedController>();
    savedController.onGetSavedArticles();

    return Obx(() {
      if (savedController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (savedController.errorMessage.value.isNotEmpty) {
        return Center(
          child: Text(savedController.errorMessage.value),
        );
      } else {
        return ListView.builder(
          itemCount: savedController.articleList.length,
          itemBuilder: (context, index) {
            final article = savedController.articleList[index];
            return ListTile(
              title: Text(article.title!),
              subtitle: Text(article.description!),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => savedController.onDeleteArticle(article),
              ),
              onTap: () => Get.to(() => DetailScreen(article: article)),
            );
          },
        );
      }
    });
  }
}
