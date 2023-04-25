import 'package:flutter/material.dart';
import 'package:music_app_ui/login.dart';
import 'package:music_app_ui/screens/about_screen.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
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
              backgroundImage: AssetImage('assets/artist/merta.jpg'),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Wayan Merta',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Music Lover',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profil'),
              onPressed: () {
                // Tambahkan navigasi ke halaman edit profil
              },
            ),
            const SizedBox(height: 16.0),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Email'),
              subtitle: const Text('wayan0468@gmail.com'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Tambahkan navigasi ke halaman ubah email
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Password'),
              subtitle: const Text('********'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Tambahkan navigasi ke halaman ubah password
              },
            ),
          //     const Divider(),
          //   ListTile(
          //   leading: Icon(Icons.engineering),
          //   title: Text('About', style: TextStyle(color: Colors.black),),
          //   onTap: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
          //     // navigate to home screen
          //   },
          //  ),
          //   const Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout', style: TextStyle(color: Colors.black),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              // perform logout action
            },
          ),
          ],
        ),
      ),
    );
  }
}
