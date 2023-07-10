import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:podcast_player/home_page.dart';
import 'package:podcast_player/profile_page.dart';
// import 'package:line_icons/line_icons.dart';
import 'package:podcast_player/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Podcast Player',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Welcome John Doe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppTheme.themeColor,
      bottomNavigationBar: CurvedNavigationBar(
        letIndexChange: (value) {
          controller.animateToPage(
            value,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOut,
          );
          return true;
        },
        backgroundColor: Colors.transparent,
        color: const Color(0xff222B45),
        buttonBackgroundColor: const Color(0xffFF3D71),
        index: index,
        iconPadding: 8,
        height: 58,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          CurvedNavigationBarItem(
            child: Icon(
              EvaIcons.home,
              color: index == 0 ? Colors.white : Colors.white.withOpacity(0.5),
            ),
            label: 'Home',
            labelStyle: TextStyle(
              color: index == 0
                  ? const Color(0xffFF3D71)
                  : Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.w500,
              fontSize: 10,
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              HeroIcons.fire,
              color: index == 1 ? Colors.white : Colors.white.withOpacity(0.5),
              weight: 0.5,
            ),
            label: 'Trend',
            labelStyle: TextStyle(
              color: index == 1
                  ? const Color(0xffFF3D71)
                  : Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.w500,
              fontSize: 10,
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              FontAwesome.compass,
              color: index == 2 ? Colors.white : Colors.white.withOpacity(0.5),
            ),
            label: 'Explore',
            labelStyle: TextStyle(
              color: index == 2
                  ? const Color(0xffFF3D71)
                  : Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.w500,
              fontSize: 10,
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              EvaIcons.message_circle_outline,
              color: index == 3 ? Colors.white : Colors.white.withOpacity(0.5),
            ),
            label: 'Chat',
            labelStyle: TextStyle(
              color: index == 3
                  ? const Color(0xffFF3D71)
                  : Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.w500,
              fontSize: 10,
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              EvaIcons.person_outline,
              color: index == 4 ? Colors.white : Colors.white.withOpacity(0.5),
            ),
            label: 'Profile',
            labelStyle: TextStyle(
              color: index == 4
                  ? const Color(0xffFF3D71)
                  : Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.w500,
              fontSize: 10,
            ),
          ),
        ],
      ),
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomePage(),
          Container(),
          Container(),
          Container(),
          const ProfilePage(),
        ],
      ),
    );
  }
}
