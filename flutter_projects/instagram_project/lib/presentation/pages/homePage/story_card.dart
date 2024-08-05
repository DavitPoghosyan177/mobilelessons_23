import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  final String? imageUrl;
  final String userName;

  const StoryCard({super.key, required this.imageUrl, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.red,
                ),
                iconSize: 64,
                padding: EdgeInsets.zero,
                onPressed: () {},
              ),
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(imageUrl ?? ""),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            userName,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
