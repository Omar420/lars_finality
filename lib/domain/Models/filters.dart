import 'dart:convert';
import 'dart:io';

class Filter {
  String key;
  dynamic value;

  Filter({required this.key, required this.value});
}

abstract class FilterRepository {
  Future<Map<String, List<dynamic>>> getFilters();
}

abstract class FilterDataSource {
  Future<Map<String, List<dynamic>>> getFilters();
}

class MockFilterDataSource implements FilterDataSource {
  @override
  Future<Map<String, List<dynamic>>> getFilters() async {
    final file = File(
        "/Users/czar/Documents/Czar Projects/flutter_lars/lib/infrastructure/datasource/mock/data.json");
    final rawData = await file.readAsString();
    final data = jsonDecode(rawData) as Map<String, dynamic>;
    final filters = <String, List<dynamic>>{};

    for (var (element as Map<String, dynamic>) in data["articles"]) {
      for (var vals in element.entries) {
        if (filters[vals.key] == null &&
            ![
              "source",
              "url",
              "urlToImage",
              "publishedAt",
              "content",
              "title",
              "description"
            ].contains(vals.key)) {
          filters[vals.key] = List.empty(growable: true);
        } else {
          if (vals.key == "source") {
            if (filters["name"] == null) {
              filters["name"] = List.empty(growable: true);
            }
            if (filters["name"] != null &&
                !filters["name"]!.contains(vals.value["name"])) {
              filters["name"]?.add(vals.value["name"]);
            }
          } else {
            if (filters[vals.key] != null &&
                !filters[vals.key]!.contains(vals.value)) {
              filters[vals.key]?.add(vals.value);
            }
          }
        }
      }
    }

    return filters;
  }
}

class FilterRepositoryImpl implements FilterRepository {
  FilterDataSource dataSource;
  FilterRepositoryImpl({required this.dataSource});
  @override
  Future<Map<String, List<dynamic>>> getFilters() async {
    return await dataSource.getFilters();
  }
}
