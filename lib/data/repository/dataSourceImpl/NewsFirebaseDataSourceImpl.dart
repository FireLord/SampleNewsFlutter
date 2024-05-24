import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:sample_news/data/model/ArticleModel.dart';
import '../dataSource/NewsFirebaseDataSource.dart';

class NewsFirebaseDataSourceImpl implements NewsFirebaseDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;

  NewsFirebaseDataSourceImpl(this.firestore, this.firebaseAuth);

  @override
  Future<List<ArticleModel>> getSavedArticleFromFb() async {
    try {
      final user = firebaseAuth.currentUser;
      if (user != null) {
        final querySnapshot = await firestore
            .collection('users')
            .doc(user.uid)
            .collection('saved_articles')
            .get();
        return querySnapshot.docs
            .map((doc) => ArticleModel.fromJson(doc.data()))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching saved articles: $e');
      }
      return [];
    }
  }

  @override
  Future<bool> saveArticleToFb(ArticleModel article) async {
    try {
      final user = firebaseAuth.currentUser;
      if (user != null) {
        await firestore
            .collection('users')
            .doc(user.uid)
            .collection('saved_articles')
            .doc(article.id.toString())
            .set(article.toJson());
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error saving article: $e');
      }
      return false;
    }
  }

  @override
  Future<bool> deleteArticleFromFb(ArticleModel article) async {
    try {
      final user = firebaseAuth.currentUser;
      if (user != null) {
        await firestore
            .collection('users')
            .doc(user.uid)
            .collection('saved_articles')
            .doc(article.id.toString())
            .delete();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting article: $e');
      }
      return false;
    }
  }
}