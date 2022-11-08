import "package:flutter/material.dart";
import 'package:flutter_application_2/pages/navpages/bar_item_page.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'package:flutter_application_2/pages/navpages/my_page.dart';
import 'package:flutter_application_2/pages/navpages/search_page.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  List pages = [
    const HomePage(),
    const BarItem(),
    const Search(),
    const MyPage()
  ];

  int currIndex = 0;

  void onTap(int index) {
    setState(() {
      currIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        currentIndex: currIndex,
        onTap: onTap,
        unselectedFontSize: 0,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.apps),
          ),
          BottomNavigationBarItem(
            label: "Bar",
            icon: Icon(Icons.bar_chart_sharp),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "Profile ",
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: pages[currIndex],
    );
  }
}
