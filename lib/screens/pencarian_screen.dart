import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, required Text child}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> songs = [    'Lose You To Love Me',    'Drivers License',    'Levitating',    'Good 4 U',    'Peaches',    'Kiss Me More',    'Montero (Call Me By Your Name)',    'Save Your Tears',    'Blinding Lights',    'Leave The Door Open',  ];

  List<String> filteredSongs = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredSongs = songs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Colors.black.withOpacity(0.8),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                searchController.clear();
                filteredSongs = songs;
              });
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search for songs',
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  filteredSongs = songs
                      .where((song) => song.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: filteredSongs.length,
              itemBuilder: (context, index) {
                final song = filteredSongs[index];
                return ListTile(
                  title: Text(song),
                  onTap: () {
                    // Tambahkan navigasi ke halaman detail lagu
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
