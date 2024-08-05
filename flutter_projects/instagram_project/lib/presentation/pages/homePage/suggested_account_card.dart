import 'package:flutter/material.dart';

class SuggestedAccountCard extends StatelessWidget {
  final String userName;
  final String photoUrl;

  const SuggestedAccountCard({
    super.key,
    required this.userName,
    required this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(photoUrl),
          ),
          const SizedBox(height: 4),
          Text(
            userName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              textStyle: const TextStyle(
                fontSize: 12,
              ),
            ),
            child: const Text('Follow'),
          ),
        ],
      ),
    );
  }
}
