import 'dart:convert';
import 'package:sample_news/data/model/Article.dart';
import 'package:http/http.dart' as http;
import 'package:sample_news/data/util/Constant.dart';
import '../util/Resource.dart';

class NewsAPIService {
  Future<Resource<List<Article>>> getNews() async {
    var client = http.Client();

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