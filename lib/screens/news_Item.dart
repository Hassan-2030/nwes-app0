import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  String articles;

  NewsItem(this.articles);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
                imageUrl: articles.urlToImage ?? "",
                height: 180,
                fit: BoxFit.fill,
                placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    ),
                errorWidget: (context, url, error) => Icon(Icons.error)),
          ),
          Text(
            articles.author ?? "",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),
          ),
          Text(
            articles.title ?? "",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
          ),
          Text(
            articles.puplishdAt?.substring(0, 10) ?? "",
            textAlign: TextAlign.right,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
