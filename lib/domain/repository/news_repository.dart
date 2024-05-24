import 'package:flutter_lars/domain/Models/news.dart';

abstract class NewsRepository {
  Future<List<News>> getNews(Map<String, dynamic> filters);
}
