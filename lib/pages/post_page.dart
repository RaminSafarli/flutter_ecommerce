import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constant/color.dart';
import 'package:flutter_ecommerce/model/login_model.dart';
import 'package:flutter_ecommerce/model/post_model.dart';
import 'package:flutter_ecommerce/service/post_service.dart';
import 'package:flutter_ecommerce/widgets/post_card.dart';

class PostPage extends StatefulWidget {
  final Login? user;
  const PostPage({super.key, this.user});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  PostService postService = PostService();
  List<PostElement> searchResults = [];
  List<PostElement> posts = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    await postService.getPosts().then((value) {
      setState(() {
        posts = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
            arguments: {'user': widget.user},
          );
        },
        child: const Icon(Icons.post_add),
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
                      "Posts",
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
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const TabBar(
                        tabs: [
                          Tab(text: 'Shared posts'),
                          Tab(text: 'Search post'),
                        ],
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.white,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            // Posts Tab Content
                            ListView.builder(
                              itemCount: posts.length,
                              itemBuilder: (context, index) {
                                return PostCardWidget(postModel: posts[index]);
                              },
                            ),
                            // Search Tab Content
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'Search posts...',
                                      prefixIcon: const Icon(Icons.search),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    onChanged: (query) {
                                      setState(() {
                                        postService.searchPosts(query).then(
                                            (value) => searchResults = value!);
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 16.0),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: searchResults.length,
                                      itemBuilder: (context, index) {
                                        final post = searchResults[index];
                                        return PostCardWidget(postModel: post);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
