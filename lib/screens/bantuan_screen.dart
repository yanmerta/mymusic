import 'package:flutter/material.dart';

class BantuanPage extends StatelessWidget {
  const BantuanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bantuan'),
        backgroundColor: Colors.black.withOpacity(0.8),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 16.0),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Cara mencari lagu'),
            subtitle: const Text('Pelajari cara mencari lagu di aplikasi kami'),
            onTap: () {
              // Tambahkan navigasi ke halaman bantuan "Cara mencari lagu"
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.playlist_add),
            title: const Text('Cara membuat playlist'),
            subtitle: const Text('Pelajari cara membuat playlist di aplikasi kami'),
            onTap: () {
              // Tambahkan navigasi ke halaman bantuan "Cara membuat playlist"
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Pengaturan aplikasi'),
            subtitle: const Text('Pelajari tentang pengaturan aplikasi kami'),
            onTap: () {
              // Tambahkan navigasi ke halaman bantuan "Pengaturan aplikasi"
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Tentang aplikasi'),
            subtitle: const Text('Pelajari tentang aplikasi kami'),
            onTap: () {
              // Tambahkan navigasi ke halaman bantuan "Tentang aplikasi"
            },
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
