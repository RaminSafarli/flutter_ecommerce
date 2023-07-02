import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constant/color.dart';
import 'package:flutter_ecommerce/model/post_model.dart';
import 'package:flutter_ecommerce/model/user_model.dart';
import 'package:flutter_ecommerce/service/user_service.dart';

class PostCardWidget extends StatefulWidget {
  final PostElement postModel;

  const PostCardWidget({required this.postModel});

  @override
  State<PostCardWidget> createState() => _PostCardWidgetState();
}

class _PostCardWidgetState extends State<PostCardWidget> {
  UserService userService = UserService();
  UserElement? user;

  @override
  void initState() {
    userService
        .getSingleUser(widget.postModel.userId)
        .then((value) => user = value!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.postModel.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.postModel.body,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          if (user != null) Text(user!.firstName ?? ''),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 17,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Likes: ${widget.postModel.reactions}',
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.postModel.tags.map((tag) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
