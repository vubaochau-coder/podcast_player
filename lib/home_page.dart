import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:podcast_player/Custom%20Widget/category_item.dart';
import 'package:podcast_player/Custom%20Widget/custom_page_route.dart';
import 'package:podcast_player/podcast_player_page.dart';
import 'package:podcast_player/models/podcast.dart';
import 'package:podcast_player/theme.dart';

import 'Custom Widget/podcast_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          foregroundColor: Colors.white,
          backgroundColor: MyAppTheme.themeColor,
          surfaceTintColor: MyAppTheme.themeColor,
          title: const Text('Welcome John Doe'),
          pinned: true,
          titleTextStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Badge(
                alignment: Alignment.bottomLeft,
                backgroundColor: Color(0xffFF3D71),
                smallSize: 8,
                child: Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                ),
              ),
            ),
          ],
          collapsedHeight: kToolbarHeight + 24,
          expandedHeight: kToolbarHeight +
              24 +
              8 +
              40 +
              32 +
              104 +
              MediaQuery.of(context).padding.top +
              64,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: [
                Container(
                  height: 24,
                  margin: EdgeInsets.only(
                      bottom: 8,
                      top: 8 + 56 + MediaQuery.of(context).padding.top),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Looking for podcast channels',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xff222B45),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: EdgeInsets.zero,
                      prefixIcon: const Icon(
                        EvaIcons.search_outline,
                        color: Colors.white,
                        size: 20,
                      ),
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        color: Color(0xff8F9BB3),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 24,
                  child: const Row(
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        EvaIcons.chevron_down,
                        color: Colors.white,
                      ),
                      Spacer(),
                      Text(
                        'View all',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 104,
                  child: ListView.separated(
                    itemCount: MyAppTheme.categories.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryItem(
                          category: MyAppTheme.categories[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 8,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(24),
            child: Container(
              height: 24,
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Podcast Episodes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: ListView.separated(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteSlideTransition(
                      child: PodcastPlayerPage(
                        podcast:
                            Podcast.podcasts[index % Podcast.podcasts.length],
                        podList: Podcast.podcasts,
                      ),
                    ),
                  );
                },
                child: PodcastItem(
                  podcast: Podcast.podcasts[index % Podcast.podcasts.length],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 16,
              );
            },
            itemCount: 22,
          ),
        ),
      ],
    );
  }
}
