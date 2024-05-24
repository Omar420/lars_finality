import 'package:flutter_lars/domain/Models/news.dart';

abstract class DataSource {
  Future<List<News>> getAllNews(Map<String, dynamic> filters);
}
