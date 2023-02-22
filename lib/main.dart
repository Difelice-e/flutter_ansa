import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.home});
  final Widget home;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: home,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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

  Widget buildHeadline() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black,
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
        Text("Casa bianca, Tarrant come pelosi e Cortez - Ultima Ora",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            )),
        SizedBox(
          height: 8,
        ),
        Text(
            "lorem ipsum is simply dummy text lorem ipsum is simply dummy text lorem ipsum is simply dummy text lorem ipsum is simply dummy text lorem ipsum is simply dummy text lorem ipsum is simply dummy text",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black45,
            )),
      ],
    );
  }

  Widget buildArticle() {
    return Row(
      children: <Widget>[
        Expanded(
            child: Column(
          children: const <Widget>[
            Text("Casa bianca, Tarrant come pelosi e Cortez - Ultima Ora",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
            SizedBox(
              height: 8,
            ),
            Text(
                "lorem ipsum is simply dummy text lorem ipsum is simply dummy text lorem ipsum is simply dummy text lorem ipsum is simply dummy text lorem ipsum is simply dummy text lorem ipsum is simply dummy text",
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
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.dehaze),
            color: Colors.black,
          ),
          title: Image.asset(
            "assets/logo_ansa.png",
            width: 150,
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: 10 + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return buildHeader();
            } else if (index == 1) {
              return Padding(
                padding: EdgeInsets.only(top: 32),
                child: buildHeadline(),
              );
            } else {
              return Padding(
                  padding: EdgeInsets.only(top: 32), child: buildArticle());
            }
          },
        ));
  }
}
