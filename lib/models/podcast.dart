class Podcast {
  final String id;
  final String img;
  final String title;
  final String date;
  final String time;

  Podcast({
    required this.id,
    required this.img,
    required this.title,
    required this.date,
    required this.time,
  });

  static List<Podcast> podcasts = [
    Podcast(
      id: '1',
      img: 'images/1.jpg',
      title: 'The Year in MoGraph - 2020',
      date: 'DEC 30, 2020',
      time: '3 hr 31 min',
    ),
    Podcast(
      id: '2',
      img: 'images/2.jpg',
      title: 'Episode 197: The World of Lettering',
      date: 'DEC 2, 2020',
      time: '42 min',
    ),
    Podcast(
      id: '3',
      img: 'images/3.jpeg',
      title: 'How to Create YouTube Video Ads That Convert',
      date: 'DEC 18, 2020',
      time: '52 min',
    ),
    Podcast(
      id: '4',
      img: 'images/4.jpeg',
      title: 'Airbnb’s Brian Chesky: Designing for trust',
      date: 'DEC 15, 2020',
      time: '46 min',
    ),
    Podcast(
      id: '5',
      img: 'images/5.jpg',
      title: 'Sounds Worth Saving',
      date: 'DEC 09, 2020',
      time: '46 min',
    ),
  ];
}
