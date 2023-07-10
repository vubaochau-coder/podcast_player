class Playlist {
  final String name;
  final int numberOfSong;

  Playlist(this.name, this.numberOfSong);

  static List<Playlist> playlist = [
    Playlist('Son Tung MTP', 12),
    Playlist('Taylor Swift', 8),
    Playlist('K-pop', 22),
  ];
}
