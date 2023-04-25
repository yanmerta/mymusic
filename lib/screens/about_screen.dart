import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key, required Text child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.black.withOpacity(0.8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 16.0),
            CircleAvatar(
              radius: 64.0,
              backgroundImage: AssetImage('assets/artist/gambar2.jpg'),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Music App',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Versi 1.0.0',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 16.0),
            ListTile(
              leading: const Icon(Icons.developer_mode),
              title: const Text('Developer'),
              subtitle: const Text('Flutter Indonesia'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Tambahkan navigasi ke halaman developer
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Kebijakan Privasi'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Tambahkan navigasi ke halaman kebijakan privasi
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Informasi Lainnya'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Tambahkan navigasi ke halaman informasi lainnya
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
