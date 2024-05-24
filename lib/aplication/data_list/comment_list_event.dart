part of 'commet_list_bloc.dart';

sealed class CommentListEvent {}

class GetCommentListEvent extends CommentListEvent {
  Map<String, dynamic> filters;

  GetCommentListEvent({required this.filters});
}
