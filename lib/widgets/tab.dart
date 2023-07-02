import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/login_model.dart';
import 'package:flutter_ecommerce/pages/cart_page.dart';
import 'package:flutter_ecommerce/pages/enterance_page.dart';
import 'package:flutter_ecommerce/pages/login_page.dart';
import 'package:flutter_ecommerce/pages/post_page.dart';
import 'package:flutter_ecommerce/pages/search_page.dart';

import '../pages/home_page.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int _item = 0;
  @override
  Widget build(BuildContext context) {
    // Retrieve the arguments
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // Extract the individual arguments
    final Login user = arguments['user'] as Login;

    List<Widget> pages = [
      HomePage(user: user),
      SearchPage(),
      CartPage(user: user),
      PostPage(user: user),
    ];
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.podcasts), label: "Post"),
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
