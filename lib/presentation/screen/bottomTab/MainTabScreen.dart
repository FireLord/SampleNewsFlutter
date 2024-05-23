import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_news/presentation/screen/bottomTab/bloc/MainTabBloc.dart';
import 'package:sample_news/presentation/screen/bottomTab/bloc/MainTabEvent.dart';
import 'package:sample_news/presentation/screen/bottomTab/bloc/MainTabState.dart';
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

    return BlocConsumer<MainTabBloc, MainTabState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Sample News"),
          ),
          body: bottomNavScreen.elementAt(state.tabIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavItems,
            currentIndex: state.tabIndex,
            selectedItemColor: Colors.deepPurple,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              BlocProvider.of<MainTabBloc>(context)
                  .add(TabChange(tabIndex: index));
            },
          ),
        );
      },
    );
  }
}
