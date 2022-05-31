class Song {
  late String id;
  late String name;
  late String avatarUrl;
  late String link;
  late String singer;
  late bool select;

  Song({required this.id, required this.name, required this.avatarUrl, required this.link, required this.select, required this.singer});
  
  Song.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    avatarUrl = json['avatarUrl'];
    link = json['link'];
    singer = json['singer'];
    select = json['select'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;  
    data['avatarUrl'] = avatarUrl;
    data['link'] = link;
    data['select'] = select;
    data['singer'] = singer;
    return data;
  }
}

late List<Song> allSongs;
late List<Song> selectedSongs = [];