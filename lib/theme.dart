import 'package:flutter/material.dart';
import 'package:podcast_player/models/category.dart';

class MyAppTheme {
  static Color themeColor = const Color(0xff192038);

  static List<Category> categories = [
    Category(
      'Education',
      const LinearGradient(
        colors: [
          Color(0xffF5AF19),
          Color(0xffF12711),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    Category(
      'Society',
      const LinearGradient(
        colors: [
          Color(0xff623DEF),
          Color(0xff340FD1),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    Category(
      'Sports',
      const LinearGradient(
        colors: [
          Color(0xff43EF1D),
          Color(0xff0D80F2),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    Category(
      'Films',
      const LinearGradient(
        colors: [
          Color(0xffE9228D),
          Color(0xffF12711),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ];
}
