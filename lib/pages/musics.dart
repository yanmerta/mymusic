import 'dart:async';
import 'package:flutter/material.dart';
import 'package:music_app_ui/models/music.dart';
import 'package:music_app_ui/services/musicdatabase.dart';

class MusicPage extends StatefulWidget {
  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final dbHelper = MusicDatabaseHelper();

  List<Music> musics = [];

  @override
  void initState() {
    super.initState();
    _fetchMusics();
  }

  Future<void> _fetchMusics() async {
    final database = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await database.query(
      'music',
      orderBy: 'title ASC',
    );
    setState(() {
      musics = List.generate(maps.length, (i) {
        return Music.fromMap(maps[i]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music'),
      ),
      body: musics.isEmpty
          ? Center(
              child: Text('No music available'),
            )
          : ListView.builder(
              itemCount: musics.length,
              itemBuilder: (context, index) {
                final music = musics[index];
                return ListTile(
                  title: Text(music.title ?? ''),
                  subtitle: Text(music.artist ?? ''),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      await dbHelper.deleteMusic(music.id!);
                      await _fetchMusics();
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_music');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
