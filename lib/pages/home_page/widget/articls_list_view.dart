import 'package:flutter/material.dart';
import 'package:news_app/core/network/api_manger.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/pages/home_page/widget/articl_view_item.dart';

class ArticlesListView extends StatelessWidget {
  String sourceId;
  ArticlesListView(this.sourceId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticlModel>(
      future: ApiManger.fetchNewsList(sourceId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Column(children: [
            Text("${snapshot.error}"),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.refresh_outlined),
            )
          ]);
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var articllist = snapshot.data?.articles ?? [];
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                if (index < articllist.length) {
                  return ArticlView(articllist[index]);
                } else {
                  return SizedBox.shrink(); // Return an empty widget if index is out of bounds
                }
              },
              itemCount: articllist.length, // Use the actual length of articllist
            ),
          );

        }
      },
    );
  }
}
