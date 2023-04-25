import 'package:flutter/material.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key, required Text child}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  // Simulasi data untuk daftar playlist, daftar lagu, dan lagu favorit
  List<String> _playlists = ['My Playlist 1', 'My Playlist 2', 'My Playlist 3'];
  List<String> _songs = ['Song 1', 'Song 2', 'Song 3', 'Song 4'];
  List<String> _favoriteSongs = ['Favorite Song 1', 'Favorite Song 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        backgroundColor: Colors.black.withOpacity(0.8),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'My Playlists',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _playlists.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_playlists[index]),
                  onTap: () {
                    // Tambahkan navigasi ke halaman playlist yang dipilih
                  },
                );
              },
            ),
            const SizedBox(height: 32.0),
            const Text(
              'My Songs',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _songs.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_songs[index]),
                  onTap: () {
                    // Tambahkan navigasi ke halaman detail lagu yang dipilih
                  },
                );
              },
            ),
            const SizedBox(height: 32.0),
            const Text(
              'Favorite Songs',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _favoriteSongs.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_favoriteSongs[index]),
                  onTap: () {
                    // Tambahkan navigasi ke halaman detail lagu yang dipilih
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
