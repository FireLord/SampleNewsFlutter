import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../injection_container.dart';
import '../detail/DetailScreen.dart';
import 'HomeController.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  buildBody() {
    final HomeController homeController = sl<HomeController>();
    homeController.onGetArticles();

    return Obx(() {
      if (homeController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (homeController.errorMessage.value.isNotEmpty) {
        return Center(
          child: Text(homeController.errorMessage.value),
        );
      } else {
        return ListView.builder(
          itemCount: homeController.articleList.length,
          itemBuilder: (context, index) {
            final article = homeController.articleList[index];
            return ListTile(
              title: Text(article.title!),
              subtitle: Text(article.description!),
              trailing: IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () => homeController.onSaveArticle(article),
              ),
              onTap: () => Get.to(() => DetailScreen(article: article)),
            );
          },
        );
      }
    });
  }
}
