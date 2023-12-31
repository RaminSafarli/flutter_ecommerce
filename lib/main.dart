import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constant/color.dart';
import 'package:flutter_ecommerce/pages/enterance_page.dart';
import 'package:flutter_ecommerce/pages/home_page.dart';
import 'package:flutter_ecommerce/pages/login_page.dart';
import 'package:flutter_ecommerce/pages/post_page.dart';
import 'package:flutter_ecommerce/pages/product_detail_page.dart';
import 'package:flutter_ecommerce/pages/profile_page.dart';
import 'package:flutter_ecommerce/pages/search_page.dart';
import 'package:flutter_ecommerce/pages/your_post_page.dart';
import 'package:flutter_ecommerce/widgets/tab.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Gotham",
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(primaryColor),
          unselectedItemColor: Colors.white,
          selectedLabelStyle: const TextStyle(fontSize: 14.00),
          unselectedLabelStyle: const TextStyle(fontSize: 14.00),
        ),
      ),
      title: 'Codelandia Shop Center',
      // home: const EnterancePage(),
      home: Scaffold(
        backgroundColor: Color(primaryColor),
        // body: const TabBarWidget(),
        body: const EnterancePage(),
      ),
      routes: {
        '/tabbar_widget': (context) => const TabBarWidget(),
        '/login_page': (context) => const LoginPage(),
        '/home_page': (context) => const HomePage(),
        '/product_detail_page': (context) => const ProductDetailPage(),
        '/search_page': (context) => SearchPage(),
        '/profile_page': (context) => const ProfilePage(),
        '/enterance_page': (context) => const EnterancePage(),
        '/post_page': (context) => const PostPage(),
        '/your_post_page': (context) => const YourPostPage(),
      },
    );
  }
}
