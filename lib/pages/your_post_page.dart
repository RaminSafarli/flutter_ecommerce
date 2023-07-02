import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constant/color.dart';
import 'package:flutter_ecommerce/model/login_model.dart';
import 'package:flutter_ecommerce/model/post_model.dart';
import 'package:flutter_ecommerce/service/post_service.dart';

class YourPostPage extends StatefulWidget {
  const YourPostPage({super.key});

  @override
  State<YourPostPage> createState() => _YourPostPageState();
}

class _YourPostPageState extends State<YourPostPage> {
  PostService postService = PostService();
  List<PostElement> posts = [];
  @override
  Widget build(BuildContext context) {
    // // Retrieve the arguments
    // final Map<String, dynamic> arguments =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // // Extract the individual arguments
    // final Login product = arguments['user'] as Login;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(primaryColor),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(primaryColor),
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/your_post_page',
          );
        },
        child: Icon(Icons.post_add),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0),
                  Colors.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1,
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // "Codelandia Shop Center",
                      "Your Posts",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white,
                              ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
