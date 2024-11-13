import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/articles_model.dart';

class ArticlView extends StatelessWidget {
  Articles articlesModel;

  ArticlView(this.articlesModel, {super.key});
  String getTimeAgo(String timeString) {
    DateTime dateTime = DateTime.parse(timeString);
    Duration difference = DateTime.now().difference(dateTime);

    if (difference.inDays > 365) {
      return DateFormat.yMMMd().format(dateTime); // Display full date if more than a year old
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ClipRRect(child:CachedNetworkImage(
          //   imageUrl: articlesModel.urlToImage ?? "",
          //    placeholder: (context, url) => const CircularProgressIndicator(),
          //   errorWidget: (context, url, error) => const Icon(Icons.error),
          // ),
          //),
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(articlesModel.urlToImage ?? "")),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              articlesModel.source?.name ?? "",
              style: const TextStyle(color: Color(0xFF79828B), fontSize: 10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(articlesModel.title ?? ""),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              getTimeAgo(articlesModel.publishedAt ?? ""),
              style: const TextStyle(color: Color(0xFF79828B), fontSize: 13),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
