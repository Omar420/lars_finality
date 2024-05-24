import 'package:flutter_lars/domain/Models/news.dart';
import 'package:flutter_lars/domain/repository/news_repository.dart';
import 'package:flutter_lars/infrastructure/datasource/data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  DataSource dataSource;
  NewsRepositoryImpl({required this.dataSource});

  @override
  Future<List<News>> getNews(Map<String, dynamic> filters) async {
    return await dataSource.getAllNews(filters);
  }
}
