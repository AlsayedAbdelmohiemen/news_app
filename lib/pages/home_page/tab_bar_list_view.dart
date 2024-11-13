import 'package:flutter/material.dart';
import 'package:news_app/pages/home_page/widget/articls_list_view.dart';
import 'package:news_app/pages/home_page/widget/tab_item.dart';

import '../../models/sources_model.dart';

class TabBarListView extends StatefulWidget {
  SourcesModel sourcesModel;

  TabBarListView(this.sourcesModel);

  @override
  State<TabBarListView> createState() => _TabBarListViewState();
}

class _TabBarListViewState extends State<TabBarListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.sourcesModel.sources == null) {
      // Handle the case where sourcesModel.sources is null
      return Center(
        child: CircularProgressIndicator(), // or any other loading indicator
      );
    }

    if (widget.sourcesModel.sources!.isEmpty) {
      // Handle the case where sourcesModel.sources is an empty list
      return Center(
        child: Text('No sources available'),
      );
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          DefaultTabController(
            initialIndex: selectedIndex,
            length: widget.sourcesModel.sources?.length ?? 0,
            child: TabBar(
              indicator: const BoxDecoration(),
              labelPadding: EdgeInsets.symmetric(horizontal: 6),
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              isScrollable: true,
              tabs: widget.sourcesModel.sources?.map((element) {
                    return TabItem(
                        element,
                        selectedIndex ==
                            widget.sourcesModel.sources!.indexOf(element));
                  }).toList() ??
                  [],
            ),
          ),
         ArticlesListView(widget.sourcesModel.sources?[selectedIndex].id ?? ""),

        ],
      ),
    );
  }
}
