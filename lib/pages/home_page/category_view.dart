import 'package:flutter/material.dart';
import 'package:news_app/core/network/api_manger.dart';
import 'package:news_app/pages/home_page/tab_bar_list_view.dart';

import '../../models/category_model.dart';
import '../../models/sources_model.dart';

class CategoryView extends StatefulWidget {
  CategoryModel selected;
  CategoryView({Key? key, required this.selected}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late Future<SourcesModel> fetchSources;
  @override
  void initState() {
    fetchSources = ApiManger.fetchSources(widget.selected.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesModel>(
      future: fetchSources,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Column(children: [
            Text("${snapshot.error}"),
            IconButton(
              onPressed: () {
                fetchSources;
              },
              icon: const Icon(Icons.refresh_outlined),
            )
          ]);
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          SourcesModel? source = snapshot.data;

          return TabBarListView(source!);
        }
      }
    );
  }
}
