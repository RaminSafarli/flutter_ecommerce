// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  List<PostElement> posts;
  int total;
  int skip;
  int limit;

  Post({
    required this.posts,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        posts: List<PostElement>.from(
            json["posts"].map((x) => PostElement.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class PostElement {
  int id;
  String title;
  String body;
  int userId;
  List<String> tags;
  int reactions;

  PostElement({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    required this.tags,
    required this.reactions,
  });

  factory PostElement.fromJson(Map<String, dynamic> json) => PostElement(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        reactions: json["reactions"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "userId": userId,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "reactions": reactions,
      };
}
