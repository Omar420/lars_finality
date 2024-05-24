import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lars/domain/Models/news.dart';
import 'package:flutter_lars/domain/repository/news_repository.dart';

part 'comment_list_state.dart';
part 'comment_list_event.dart';

class CommentListBloc extends Bloc<CommentListEvent, CommentListState> {
  final NewsRepository repository;

  CommentListBloc({required this.repository})
      : super(CommentListState(
            data: List.empty(), filters: <String, dynamic>{})) {
    on<GetCommentListEvent>(onGetCommentListEvent);
  }

  onGetCommentListEvent(
      GetCommentListEvent event, Emitter<CommentListState> emit) async {
    final data = await repository.getNews(event.filters);
    // data.sort((a, b) => b.dateRegister.compareTo(a.dateRegister));
    emit(CommentListState(data: data, filters: event.filters));
  }
}
