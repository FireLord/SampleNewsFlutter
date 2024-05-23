import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_news/presentation/screen/bottomTab/MainTabScreen.dart';
import 'package:sample_news/presentation/screen/bottomTab/bloc/MainTabBloc.dart';

class AppRoutes {
  Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch(settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => MainTabBloc(),
            child: const MainTabScreen(),
          ),
        );
      default:
        return materialRoute(const Placeholder());
    }
  }

  static Route<dynamic> materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}