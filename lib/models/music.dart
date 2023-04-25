class Music {
  int? id;
  String? title;
  String? artist;
  String? genre;
  int? year;

  Music({this.id, this.title, this.artist, this.genre, this.year});

  Music.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    artist = map['artist'];
    genre = map['genre'];
    year = map['year'];
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['artist'] = artist;
    map['genre'] = genre;
    map['year'] = year;
    return map;
  }
}
