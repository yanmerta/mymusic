import 'package:flutter/material.dart';
import 'package:music_app_ui/models/music.dart';
import 'package:music_app_ui/services/musicdatabase.dart';

class AddMusicScreen extends StatefulWidget {
  const AddMusicScreen({Key? key}) : super(key: key);

  @override
  _AddMusicScreenState createState() => _AddMusicScreenState();
}

class _AddMusicScreenState extends State<AddMusicScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _artistController = TextEditingController();
  final _genreController = TextEditingController();
  final _yearController = TextEditingController();
  final dbHelper = MusicDatabaseHelper();

  @override
  void dispose() {
    _titleController.dispose();
    _artistController.dispose();
    _genreController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Music'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _artistController,
                decoration: const InputDecoration(labelText: 'Artist'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an artist';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _genreController,
                decoration: const InputDecoration(labelText: 'Genre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a genre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _yearController,
                decoration: const InputDecoration(labelText: 'Year'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a year';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final music = Music(
                        title: _titleController.text,
                        artist: _artistController.text,
                        genre: _genreController.text,
                        year: int.tryParse(_yearController.text) ?? 0,
                      );

                      // Buka koneksi database
                      final db = await dbHelper.openDb();

                      // Insert data ke database
                      await db.insert('musics', music.toMap());

                      // Tutup koneksi database
                      await dbHelper.closeDb();

                      // Kembali ke halaman sebelumnya
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Save'),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
