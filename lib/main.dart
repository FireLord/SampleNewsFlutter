import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_news/data/db/NewsDatabase.dart';
import 'package:sample_news/injection_container.dart';
import 'package:sample_news/presentation/screen/HomeScreen.dart';
import 'package:sample_news/presentation/screen/bloc/HomeBloc.dart';
import 'package:sample_news/presentation/screen/bloc/HomeEvent.dart';

late NewsDatabase newsDatabase;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  newsDatabase = sl<NewsDatabase>();
  await initDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
