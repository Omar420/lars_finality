import 'package:bloc/bloc.dart';
import 'package:flutter_lars/domain/Models/filters.dart';

part 'filters_event.dart';
part 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  FilterRepository repository;
  FiltersBloc({required this.repository}) : super(FiltersState(filters: {})) {
    on<GetFilters>(onGetFilters);
    add(GetFilters());
  }

  onGetFilters(GetFilters event, Emitter<FiltersState> emit) async {
    final filters = await repository.getFilters();
    emit(FiltersState(filters: filters));
  }
}
