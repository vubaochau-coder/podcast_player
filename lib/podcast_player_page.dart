import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marquee/marquee.dart';
import 'package:podcast_player/Custom%20Widget/podcast_item.dart';
import 'package:podcast_player/models/podcast.dart';
import 'package:podcast_player/theme.dart';

class PodcastPlayerPage extends StatelessWidget {
  final Podcast podcast;
  final List<Podcast> podList;
  const PodcastPlayerPage({
    super.key,
    required this.podcast,
    required this.podList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppTheme.themeColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 232 + 56 + 232 + 8,
            foregroundColor: Colors.white,
            backgroundColor: MyAppTheme.themeColor,
            surfaceTintColor: MyAppTheme.themeColor,
            elevation: 0,
            pinned: true,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                EvaIcons.arrow_ios_back,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                width: double.infinity,
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(
                  top: kToolbarHeight + MediaQuery.of(context).viewPadding.top,
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    const SizedBox(
                      width: 248,
                      height: 232,
                    ),
                    Positioned(
                      top: 0,
                      width: 248,
                      height: 232,
                      child: Container(
                        height: 232,
                        width: 248,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              podcast.img,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          EvaIcons.heart_outline,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  EvaIcons.settings_2_outline,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  EvaIcons.more_vertical,
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(208),
              child: Container(
                color: MyAppTheme.themeColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 24,
                      margin: const EdgeInsets.symmetric(horizontal: 0),
                      child: Marquee(
                        text: podcast.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        scrollAxis: Axis.horizontal,
                        blankSpace: 60,
                        pauseAfterRound: const Duration(seconds: 0),
                        showFadingOnlyWhenScrolling: true,
                        fadingEdgeEndFraction: 0.3,
                        fadingEdgeStartFraction: 0.3,
                      ),
                    ),
                    Container(
                      height: 48,
                      margin: const EdgeInsets.only(left: 0, right: 0, top: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              EvaIcons.shuffle,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              EvaIcons.skip_back,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              EvaIcons.play_circle,
                              color: Colors.white,
                              size: 48,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              EvaIcons.skip_forward,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              EvaIcons.sync,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 36,
                      margin: const EdgeInsets.only(
                          left: 16, right: 16, top: 20, bottom: 16),
                      child: ProgressBar(
                        progress: const Duration(seconds: 35),
                        buffered: const Duration(seconds: 127),
                        total: const Duration(seconds: 185),
                        baseBarColor: Colors.white.withOpacity(0.3),
                        progressBarColor: const Color(0xffFF3D71),
                        bufferedBarColor:
                            const Color(0xffFF3D71).withOpacity(0.5),
                        thumbColor: Colors.white,
                        timeLabelTextStyle: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 12,
                        ),
                        onSeek: (duration) {},
                      ),
                    ),
                    Container(
                      height: 24,
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Favorite Podcast Episodes',
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
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListView.separated(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return PodcastItem(
                  podcast: Podcast.podcasts[index % Podcast.podcasts.length],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
