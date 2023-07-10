import 'package:flutter/material.dart';
import 'package:podcast_player/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 104,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: category.background,
      ),
      child: Center(
        child: Text(
          category.content,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
