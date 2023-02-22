import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_ansa/models/article.dart';

class ArticleDetailPage extends StatelessWidget {
  const ArticleDetailPage({super.key, required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              launchUrl(Uri.parse(article.url));
            },
            icon: Icon(Icons.link),
            color: Colors.black,
          )
        ],
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Column(
              children: <Widget>[
                Text("Notizia corrente",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                SizedBox(
                  height: 8,
                ),
                Text(article.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                SizedBox(
                  height: 16,
                ),
              ],
            )),
      ),
      body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(article.urlToImage),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Text(article.content,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  )),
            ],
          )),
    );
  }
}
