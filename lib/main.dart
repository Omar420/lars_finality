import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lars/aplication/data_list/commet_list_bloc.dart';
import 'package:flutter_lars/aplication/filters/filters_bloc.dart';
import 'package:flutter_lars/domain/Models/filters.dart';
import 'package:flutter_lars/infrastructure/datasource/mock/mock_data_source.dart';
import 'package:flutter_lars/infrastructure/reposiroty_implementation/news_repository_impl.dart';
import 'package:flutter_lars/infrastructure/reposiroty_implementation/repository_implementation_data_list.dart';
import 'package:flutter_lars/presentation/screens/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final commentListRepository = CommentListRepositoryImplementation();
  final newsRepository = NewsRepositoryImpl(dataSource: MockDataSource());
  final filterRepository =
      FilterRepositoryImpl(dataSource: MockFilterDataSource());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CommentListBloc(repository: newsRepository),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => FiltersBloc(repository: filterRepository),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: HomeScreen(),
      ),
    );
  }
}
