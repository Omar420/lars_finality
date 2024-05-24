import 'dart:convert';
import 'dart:io';

import 'package:flutter_lars/domain/Models/news.dart';
import 'package:flutter_lars/infrastructure/datasource/data_source.dart';

class MockDataSource implements DataSource {
  @override
  Future<List<News>> getAllNews(filters) async {
    final file = File(
        "/Users/czar/Documents/Czar Projects/flutter_lars/lib/infrastructure/datasource/mock/data.json");
    final rawData = await file.readAsString();
    final data = jsonDecode(rawData) as Map<String, dynamic>;
    return (data["articles"] as List<dynamic>)
        .where((element) {
          if (filters.isEmpty) return true;
          for (var keys in filters.entries) {
            if (keys.key == 'name') {
              if (element["source"][keys.key] == keys.value) {
                return true;
              }
            } else if (element[keys.key] == keys.value) {
              return true;
            }
          }
          return false;
        })
        .map((e) => News.fromJSON(e))
        .toList();
  }
}
