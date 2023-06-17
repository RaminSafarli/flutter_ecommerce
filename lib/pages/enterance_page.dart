import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constant/color.dart';

class EnterancePage extends StatefulWidget {
  const EnterancePage({super.key});

  @override
  State<EnterancePage> createState() => _EnterancePageState();
}

class _EnterancePageState extends State<EnterancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(primaryColor),
                  Colors.black,
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Welcome to our store",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login_page');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(primaryColor),
                      foregroundColor: Color(hoverColor)),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home_page');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(primaryColor),
                      foregroundColor: Color(hoverColor)),
                  child: const Text(
                    "Register",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
