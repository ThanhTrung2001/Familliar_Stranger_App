class Song {
  final int id;
  final String name;
  final String avatar;
  final String link;
  final String singer;
  late bool select;

  Song({
    required this.id,
    required this.name,
    required this.avatar,
    required this.link,
    required this.select,
    required this.singer,
  });
}

final Song test1 = Song(
    id: 01,
    name: "Day dut noi dau",
    avatar: 'assets/Images/avatar.jpg',
    link:
        "https://sendeyo.com/updownload/file/script/aab52884da94aab899ba9bae63a4a2fb.mp3",
    select: false,
    singer: 'Mr Siro');
final Song test2 = Song(
    id: 02,
    name: "Lang nghe nuoc mat",
    avatar: 'assets/Images/avatar.jpg',
    link:
        "https://sendeyo.com/updownload/file/script/e5972578a874ee5b448b04e7b01dc6ee.mp3",
    select: false,
    singer: 'Mr Siro');

final List<Song> SelectedSongs = [];

final List<Song> AllSongs = [
  test1,
  test2,
];
