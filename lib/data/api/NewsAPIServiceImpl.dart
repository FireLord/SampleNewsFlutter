import 'dart:convert';
import 'package:http/http.dart';
import 'package:sample_news/data/model/Article.dart';
import 'package:sample_news/data/util/Constant.dart';
import '../util/Resource.dart';
import 'NewsAPIService.dart';

class NewsAPIServiceImpl implements NewsAPIService{
  final Client client;

  NewsAPIServiceImpl(this.client);

  @override
  Future<Resource<List<Article>>> getNews() async {
    try {
      Map<String, String> queryParams = {
        'country': 'in',
        'apiKey': API_KEY,
      };

      var uri = Uri(
        scheme: 'https',
        host: API_URL,
        path: '/v2/top-headlines',
        queryParameters: queryParams,
      );

      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var data = response.body;
        final Map<String, dynamic> parsed = json.decode(data);
        List<Article> articles = (parsed['articles'] as List)
            .map((article) => Article.fromJson(article))
            .toList();
        return Success(articles);
      } else {
        return Failure('Failed to load news: ${response.statusCode}', null);
      }
    } catch (e) {
      return Failure('Error fetching news: $e', null);
    } finally {
      client.close();
    }
  }
}