import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/pages/enterance_page.dart';
import 'package:flutter_ecommerce/pages/login_page.dart';
import 'package:flutter_ecommerce/pages/search_page.dart';

import '../pages/home_page.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  List<Widget> pages = [
    const HomePage(),
    SearchPage(),
    const EnterancePage(),
    const LoginPage(),
  ];
  int _item = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_music), label: "Library"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          currentIndex: _item,
          onTap: (value) => {
            setState(() {
              _item = value;
            }),
          },
        ),
        body: pages[_item]);
  }

  IgnorePointer ignorePointerMethod(int index, Widget widget) {
    return IgnorePointer(
      child: Opacity(
        opacity: _item == index ? 1 : 0,
        child: widget,
      ),
    );
  }
}
