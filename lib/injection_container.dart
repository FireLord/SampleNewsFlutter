import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:sample_news/data/api/NewsAPIService.dart';
import 'package:sample_news/data/db/NewsDao.dart';
import 'package:sample_news/data/db/NewsDatabase.dart';
import 'package:sample_news/data/repository/dataSource/NewsLocalDataSource.dart';
import 'package:sample_news/data/repository/dataSource/NewsRemoteDataSource.dart';
import 'package:sample_news/data/repository/dataSourceImpl/NewsFirebaseDataSourceImpl.dart';
import 'package:sample_news/data/repository/dataSourceImpl/NewsRemoteDataSourceImpl.dart';
import 'package:sample_news/domain/repository/NewsRepository.dart';
import 'package:sample_news/domain/usecase/FetchNewsArticleUseCase.dart';
import 'package:sample_news/presentation/screen/auth/AuthController.dart';
import 'package:sample_news/presentation/screen/bottomTab/MainTabController.dart';
import 'package:sample_news/presentation/screen/home/HomeController.dart';
import 'package:sample_news/presentation/screen/saved/SavedController.dart';
import 'data/repository/AuthRepositoryImpl.dart';
import 'data/repository/NewsRepositoryImpl.dart';
import 'data/repository/dataSource/NewsFirebaseDataSource.dart';
import 'data/repository/dataSource/auth/AuthFirebaseDataSource.dart';
import 'data/repository/dataSourceImpl/NewsLocalDataSourceImpl.dart';
import 'data/repository/dataSourceImpl/auth/AuthFirebaseDataSourceImpl.dart';
import 'domain/repository/AuthRepository.dart';
import 'domain/usecase/DeleteNewsArticleUseCase.dart';
import 'domain/usecase/GetSavedNewsArticleUseCase.dart';
import 'domain/usecase/SaveNewsArticleUseCase.dart';
import 'package:get/get.dart';

final sl = GetIt.instance;

Future<void> initDependency() async {
  // Client as Singleton
  sl.registerSingleton<Client>(Client());

  // NewsAPIService as Singleton
  sl.registerSingleton(NewsAPIService(sl()));

  // NewsDatabase as Singleton
  sl.registerSingletonAsync<NewsDatabase>(() async {
    final newsDatabase = await NewsDatabase.create();
    return newsDatabase;
  });

  await sl.allReady();

  // NewsDao as Singleton
  sl.registerSingleton(NewsDao(sl()));

  // FirebaseAuth as Singleton
  sl.registerSingleton(FirebaseAuth.instance);

  // FirebaseFirestore as Singleton
  sl.registerSingleton(FirebaseFirestore.instance);

  // NewsRemoteDataSourceImpl as Singleton
  sl.registerSingleton<NewsRemoteDataSource>(NewsRemoteDataSourceImpl(sl()));

  // NewsLocalDataSourceImpl as Singleton
  sl.registerSingleton<NewsLocalDataSource>(NewsLocalDataSourceImpl(sl()));

  // NewsFirebaseDataSource as Singleton
  sl.registerSingleton<NewsFirebaseDataSource>(NewsFirebaseDataSourceImpl(sl(), sl()));

  // NewsRepositoryImpl as Singleton
  sl.registerSingleton<NewsRepository>(NewsRepositoryImpl(sl(), sl(), sl()));

  // AuthFirebaseDataSourceImpl as Singleton
  sl.registerSingleton<AuthFirebaseDataSource>(AuthFirebaseDataSourceImpl(sl()));

  // AuthRepositoryImpl as Singleton
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));

  // FetchNewsUseCase as Singleton
  sl.registerSingleton(FetchNewsArticleUseCase(sl()));

  // SaveNewsArticleUseCase as Singleton
  sl.registerSingleton(SaveNewsArticleUseCase(sl()));

  // DeleteNewsArticleUseCase as Singleton
  sl.registerSingleton(DeleteNewsArticleUseCase(sl()));

  // GetSavedNewsArticleUseCase as Singleton
  sl.registerSingleton(GetSavedNewsArticleUseCase(sl()));

  // HomeController as Singleton
  sl.registerSingleton(Get.put(HomeController(sl(), sl())));

  // SavedController as Singleton
  sl.registerSingleton(Get.put(SavedController(sl(), sl())));

  // AuthController as Singleton
  sl.registerSingleton(Get.put(AuthController(sl())));

  // MainTabController as Singleton
  sl.registerSingleton(Get.put(MainTabController()));
}