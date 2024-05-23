import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_news/data/model/ArticleModel.dart';
import 'package:sample_news/presentation/screen/bottomTab/MainTabScreen.dart';
import 'package:sample_news/presentation/screen/bottomTab/bloc/MainTabBloc.dart';
import 'package:sample_news/presentation/screen/detail/DetailScreen.dart';

class AppRoutes {
  Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch(settings.name) {
      case '/':
        return materialRoute(
          BlocProvider(
            create: (_) => MainTabBloc(),
            child: const MainTabScreen(),
          ),
        );

      case "/detailScreen":
        return materialRoute(DetailScreen(article: settings.arguments as ArticleModel));

      default:
        return materialRoute(const Placeholder());
    }
  }

  static Route<dynamic> materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}