import 'package:flutter/material.dart';
import 'package:music_app_ui/admin/Homepage.dart';
import 'package:music_app_ui/models/artists.dart';
import 'package:music_app_ui/models/packages.dart';
import 'package:music_app_ui/models/songs.dart';
import 'package:music_app_ui/pages/music_detail.dart';
import 'package:music_app_ui/pages/package_page.dart';
import 'package:music_app_ui/pages/products.dart';
import 'package:music_app_ui/providers/package_provider.dart';
import 'package:music_app_ui/providers/recent_played_provider.dart';
import 'package:music_app_ui/providers/song_provider.dart';
import 'package:music_app_ui/screens/bantuan_screen.dart';
import 'package:music_app_ui/widgets/fav_artist_item.dart';
import 'package:music_app_ui/widgets/home_page_header.dart';
import 'package:music_app_ui/widgets/home_page_title.dart';
import 'package:music_app_ui/widgets/song_package_item.dart';
import 'package:provider/provider.dart';
import 'package:music_app_ui/pages/musics.dart';

import '../login.dart';
import '../screens/profil_screen.dart';
import '../screens/pengaturan_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //sementara kita pakai listSong karena belu ada data recent
    RecentProvider recentProvider = Provider.of<RecentProvider>(context);
    List<SongModel> recent = recentProvider.recent.reversed.toList();
    List<PackageModel> madeForYou = packages;
    List<PackageModel> popularHits = packages.reversed.toList();
    PackageProvider packageProvider = Provider.of<PackageProvider>(context);
    SongProvider songProvider = Provider.of<SongProvider>(context);
    return Scaffold(
      appBar: AppBar(
         title: Text('My Music'),
          backgroundColor: Colors.black.withOpacity(0.8),
        ),
        drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.8)),
            accountName: Text('Wayan Merta'),
            accountEmail: Text('wayan0468@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/artist/merta.jpg'),
            ),
          ),
           ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting', style: TextStyle(color: Colors.black),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage()));
              // navigate to home screen
            },
          ),
          ListTile(
            leading: Icon(Icons.manage_accounts),
            title: Text('Profil Saya', style: TextStyle(color: Colors.black),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilPage()));
              // navigate to settings screen
            },
          ),
          ListTile(
            leading: Icon(Icons.playlist_add),
            title: Text('PlayList', style: TextStyle(color: Colors.black),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePages()));
              // navigate to home screen
            },
           ),
            ListTile(
            leading: Icon(Icons.help),
            title: Text('Bantuan', style: TextStyle(color: Colors.black),),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BantuanPage()));
              // navigate to home screen
            },
           ),
            Divider(),
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
    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const HomePageHeader(),
          Column(
            children: [
              const SizedBox(height: 20),
            const HomePageTitle(text: 'Your Favorite artist', style: TextStyle(color: Colors.black)),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    ...List.generate(
                        listArtists.length,
                        (index) => Padding(
                              padding: index == 0
                                  ? const EdgeInsets.only(left: 10, right: 10)
                                  : const EdgeInsets.only(right: 10),
                              child: FavArtistItem(
                                artist: listArtists[index],
                              ),
                            ))
                  ],
                ),
              ),
            ],
          ),
          recent.isNotEmpty
              ? Column(
                  children: [
                    const SizedBox(height: 20),
                    const HomePageTitle(text: 'Recent Played', style: TextStyle(color: Colors.black)),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: [
                            ...List.generate(
                                recent.length,
                                (index) => Padding(
                                      padding: index == 0
                                          ? const EdgeInsets.only(
                                              left: 10, right: 10)
                                          : const EdgeInsets.only(right: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          songProvider.currentSong =
                                              recent[index];
                                          packageProvider.currentPackage = null;
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const MusicDetail()));
                                        },
                                        child: SongPackageItem(
                                            image:
                                                'cover/${recent[index].image}',
                                            text: recent[index].title!),
                                      ),
                                    ))
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
          Column(
            children: [
              const SizedBox(height: 20),
             const HomePageTitle(text: 'Made For You', style: TextStyle(color: Colors.black)),

              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    ...List.generate(
                        madeForYou.length,
                        (index) => Padding(
                              padding: index == 0
                                  ? const EdgeInsets.only(left: 10, right: 10)
                                  : const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  packageProvider.currentPackage =
                                      madeForYou[index];
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const PackagePage()));
                                },
                                child: SongPackageItem(
                                    image: 'package/${madeForYou[index].image}',
                                    text: madeForYou[index].name!),
                              ),
                            ))
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 20),
             const HomePageTitle(text: 'Popular Hits', style: TextStyle(color: Colors.black)),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    ...List.generate(
                        popularHits.length,
                        (index) => Padding(
                              padding: index == 0
                                  ? const EdgeInsets.only(left: 10, right: 10)
                                  : const EdgeInsets.only(right: 10),
                              child: SongPackageItem(
                                  image: 'package/${popularHits[index].image}',
                                  text: popularHits[index].name!),
                            ))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    );
  }
}
