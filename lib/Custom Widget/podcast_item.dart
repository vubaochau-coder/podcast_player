import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:podcast_player/models/podcast.dart';

class PodcastItem extends StatelessWidget {
  final Podcast podcast;
  const PodcastItem({super.key, required this.podcast});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(
                  podcast.img,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Text(
                      podcast.date,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      podcast.time,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Text(
                  podcast.title,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            EvaIcons.more_vertical,
            color: Colors.white,
            size: 18,
          ),
        ],
      ),
    );
  }
}
