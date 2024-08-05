import 'package:flutter/material.dart';
import 'package:instagram_project/data/models/post/post_model.dart';

class PostsView extends StatelessWidget {
  final List<Post>? posts;

  const PostsView({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemCount: posts?.length,
      itemBuilder: (context, index) {
        final post = posts?[index];
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(post?.postUrl??""),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
