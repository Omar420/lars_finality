import 'package:flutter_lars/domain/Models/model_comment_list.dart';
import 'package:flutter_lars/domain/repository/reposiroty_data_list.dart';
import 'package:flutter_lars/infrastructure/datasource/http/datasoruce_data_list.dart';

class CommentListRepositoryImplementation implements CommentListRepository {
  final CommentListDataSoruce dataSource = CommentListDataSoruce();

  @override
  Future<List<CommentList>> getDataList() async {
    try {
      return await dataSource.getCommentList();
    } catch (e) {
      return List.empty();
    }
  }
}
