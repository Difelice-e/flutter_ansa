import 'package:flutter/material.dart';
import 'package:flutter_ansa/pages/article_details.dart';

import 'package:flutter_ansa/providers/api.dart';
import 'package:flutter_ansa/models/article.dart';

class LastHourPage extends StatelessWidget {
  const LastHourPage({super.key});

  Widget buildHeader() {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text("Notizie dell'ultima ora",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            Text("Top 10 storie qui per te",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.black45,
                )),
          ],
        ),
        Expanded(child: Container()),
        Column(
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text("17 mar",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.black45,
                )),
          ],
        )
      ],
    );
  }

  Widget buildHeadline(BuildContext context, Article article) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticleDetailPage(article: article)));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text("NOTIZIE DI PUNTA",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                )),
            SizedBox(
              height: 8,
            ),
            Text(article.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                )),
            SizedBox(
              height: 8,
            ),
            Text(article.content,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black45,
                )),
          ],
        ));
  }

  Widget buildArticle(BuildContext context, Article article) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticleDetailPage(article: article)));
        },
        child: Row(
          children: <Widget>[
            Expanded(
                child: Column(
              children: <Widget>[
                Text(article.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )),
                SizedBox(
                  height: 8,
                ),
                Text(article.content,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black45,
                    )),
              ],
            )),
            SizedBox(
              width: 16,
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: topHeadlines(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());

          case ConnectionState.done:
            List<Article>? articles = snapshot.data;

            return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: 10 + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return buildHeader();
                } else if (index == 1) {
                  return Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: buildHeadline(context, articles![index - 1]),
                  );
                } else {
                  return Padding(
                      padding: EdgeInsets.only(top: 32),
                      child: buildArticle(context, articles![index - 1]));
                }
              },
            );

          default:
            return Center(child: Text("ERRORE"));
        }
      },
    );
  }
}
