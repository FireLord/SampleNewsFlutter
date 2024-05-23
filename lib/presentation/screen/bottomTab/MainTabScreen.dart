import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_news/presentation/screen/bottomTab/bloc/MainTabBloc.dart';
import 'package:sample_news/presentation/screen/bottomTab/bloc/MainTabEvent.dart';
import 'package:sample_news/presentation/screen/bottomTab/bloc/MainTabState.dart';
import 'package:sample_news/presentation/screen/home/HomeScreen.dart';
import '../../../injection_container.dart';
import '../home/bloc/HomeBloc.dart';
import '../home/bloc/HomeEvent.dart';
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

    return MultiBlocProvider(
      providers: [
        BlocProvider<MainTabBloc>(
          create: (_) => MainTabBloc(),
        ),
        BlocProvider(
          create: (_) => sl<HomeBloc>()..add(const GetArticles()),
        ),
      ],
      child: BlocConsumer<MainTabBloc, MainTabState>(
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
      ),
    );
  }
}
