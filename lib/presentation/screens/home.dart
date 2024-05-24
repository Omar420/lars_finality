import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lars/aplication/data_list/commet_list_bloc.dart';
import 'package:flutter_lars/aplication/filters/filters_bloc.dart';
import 'package:flutter_lars/presentation/widgets/list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lars List"),
      ),
      body: BlocBuilder<CommentListBloc, CommentListState>(
        builder: (contextData, dataState) {
          return BlocBuilder<FiltersBloc, FiltersState>(
            builder: (contextFilter, filterState) {
              return RefreshIndicator(
                onRefresh: () async {
                  // print("HIIIIII?");
                  context
                      .read<CommentListBloc>()
                      .add(GetCommentListEvent(filters: dataState.filters));
                  return Future<void>.delayed(const Duration(seconds: 3));
                },
                child: Column(
                  children: [
                    ExpansionTile(
                      title: const Text("Filters"),
                      children: <Widget>[
                        Column(
                          children: [
                            for (var category in filterState.filters.entries)
                              ExpansionTile(
                                title: Text(category.key),
                                children: <Widget>[
                                  Wrap(
                                    children: [
                                      ...category.value.map((e) {
                                        return ElevatedButton(
                                          style:
                                              dataState.filters[category.key] ==
                                                      e
                                                  ? ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.blueAccent,
                                                    )
                                                  : null,
                                          onPressed: () {
                                            var oldFilters = dataState.filters;

                                            if (oldFilters[category.key] == e) {
                                              oldFilters.remove(category.key);
                                            } else {
                                              oldFilters[category.key] = e;
                                            }
                                            context
                                                .read<CommentListBloc>()
                                                .add(GetCommentListEvent(
                                                  filters: oldFilters,
                                                ));
                                          },
                                          child: Text(e.toString(),
                                              style: dataState.filters[
                                                          category.key] ==
                                                      e
                                                  ? const TextStyle(
                                                      color: Colors.white)
                                                  : null),
                                        );
                                      })
                                    ],
                                  )
                                ],
                              ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: width,
                      height: height,
                      color: Colors.white,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16.0),
                        itemCount: dataState.data.length,
                        itemBuilder: (context, index) {
                          return CardWidget(
                            commentData: dataState.data[index],
                            width: width,
                            height: height,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
