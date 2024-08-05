import 'package:flutter/material.dart';

class TagsView extends StatelessWidget {
  final int itemCount;
  final Color color;

  const TagsView({super.key, required this.itemCount, required this.color});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Container(
          color: color,
        );
      },
    );
  }
}
