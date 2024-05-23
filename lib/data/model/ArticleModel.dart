import 'package:objectbox/objectbox.dart';
import 'package:sample_news/domain/entities/ArticleEntity.dart';

@Entity()
class ArticleModel extends ArticleEntity{
  @Id()
  int? id;

  ArticleModel({
    this.id,
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) => ArticleModel(
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      urlToImage: map['urlToImage'] ?? "",
      publishedAt: map['publishedAt'] ?? "",
      content: map['content'] ?? ""
  );
}
