import 'package:flutter/material.dart';
import 'package:flutter_ansa/pages/article_details.dart';

import 'package:flutter_ansa/providers/api.dart';
import 'package:flutter_ansa/models/article.dart';

class HistoricPage extends StatelessWidget {
  const HistoricPage({super.key});

  Widget buildArticle(BuildContext context, Article article) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticleDetailPage(
                        article: article,
                      )));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(article.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                )),
            SizedBox(
              height: 8,
            ),
            Text(article.content,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black45,
                )),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: everything(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());

          case ConnectionState.done:
            List<Article>? articles = snapshot.data;

            return GridView.count(
                padding: EdgeInsets.all(16),
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: List.generate(articles!.length, (int index) {
                  return buildArticle(context, articles[index]);
                }));

          default:
            return Center(child: Text("ERRORE"));
        }
      },
    );
  }
}
