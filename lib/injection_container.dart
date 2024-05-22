import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:sample_news/data/api/NewsAPIService.dart';
import 'package:sample_news/data/api/NewsAPIServiceImpl.dart';
import 'package:sample_news/data/repository/dataSource/NewsRemoteDataSource.dart';
import 'package:sample_news/data/repository/dataSourceImpl/NewsRemoteDataSourceImpl.dart';
import 'package:sample_news/domain/repository/NewsRepository.dart';
import 'package:sample_news/domain/usecase/FetchNewsArticleUseCase.dart';
import 'data/repository/NewsRepositoryImpl.dart';

final sl = GetIt.instance;

Future<void> initDependency() async {
  sl.registerSingleton<Client>(Client());

  // NewsAPIService as Singleton
  sl.registerSingleton<NewsAPIService>(NewsAPIServiceImpl(sl()));

  // NewsRemoteDataSourceImpl as Singleton
  sl.registerSingleton<NewsRemoteDataSource>(NewsRemoteDataSourceImpl(sl()));

  // RepositoryImpl as Singleton
  sl.registerSingleton<NewsRepository>(NewsRepositoryImpl(sl()));

  // UseCase as Singleton
  sl.registerSingleton(FetchNewsArticleUseCase(sl()));
}