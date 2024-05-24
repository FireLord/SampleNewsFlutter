import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_news/presentation/screen/bottomTab/MainTabController.dart';
import 'package:sample_news/presentation/screen/home/HomeScreen.dart';
import '../saved/SavedScreen.dart';

class MainTabScreen extends StatelessWidget {
  const MainTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> bottomNavItems =
        const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.save),
        label: "Saved",
      ),
    ];

    const List<Widget> bottomNavScreen = <Widget>[HomeScreen(), SavedScreen()];
    final MainTabController mainTabController = Get.put(MainTabController());

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Sample News"),
        ),
        body: bottomNavScreen[mainTabController.tabIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          items: bottomNavItems,
          currentIndex: mainTabController.tabIndex.value,
          onTap: (index) => mainTabController.tabIndex.value = index,
        ),
      );
    });
  }
}
