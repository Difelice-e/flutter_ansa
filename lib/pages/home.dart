import 'package:flutter/material.dart';
import 'package:flutter_ansa/pages/last_hour.dart';
import 'package:flutter_ansa/pages/historic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

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
        body: PageView(
          controller: _pageController,
          onPageChanged: (int index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          children: const <Widget>[
            LastHourPage(),
            HistoricPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPageIndex,
          unselectedItemColor: Colors.black26,
          selectedItemColor: Colors.black,
          onTap: (int index) {
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 200), curve: Curves.linear);
          },
          items: const [
            BottomNavigationBarItem(
                label: "In tendenza", icon: Icon(Icons.star)),
            BottomNavigationBarItem(
                label: "Tutti", icon: Icon(Icons.hourglass_full)),
          ],
        ));
  }
}
