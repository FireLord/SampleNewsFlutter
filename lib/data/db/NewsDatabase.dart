import 'package:path_provider/path_provider.dart';
import '../../objectbox.g.dart';
import 'package:path/path.dart' as p;

class NewsDatabase {
  final Store store;

  NewsDatabase(this.store);

  static Future<NewsDatabase> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "newsDatabase"));
    return NewsDatabase(store);
  }

  void close() {
    store.close();
  }
}