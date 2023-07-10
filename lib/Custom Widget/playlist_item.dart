import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:podcast_player/models/playlist_model.dart';

class PlaylistItem extends StatelessWidget {
  final Playlist playlist;
  const PlaylistItem({super.key, required this.playlist});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 64,
          height: 64,
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white38,
          ),
          child: const Icon(
            EvaIcons.music,
            color: Colors.white70,
            size: 32,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                playlist.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              Text(
                '${playlist.numberOfSong} songs',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
