import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_lars/domain/Models/model_comment_list.dart';

class CommentListDataSoruce {
  Future<List<CommentList>> getCommentList() async {
    try {
      List<CommentList> commentList = List.empty(growable: true);

      final data = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

      for (var element in jsonDecode(data.body) as List<dynamic>) {
        commentList.add(CommentList.fromJson(element));
      }

      return commentList;
    } catch (e) {
      return List.empty();
    }
  }
}
