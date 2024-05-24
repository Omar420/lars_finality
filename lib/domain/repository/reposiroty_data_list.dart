import 'package:flutter_lars/domain/Models/model_comment_list.dart';

abstract class CommentListRepository {
  Future<List<CommentList>> getDataList();
}
