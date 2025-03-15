import 'package:adaola/widgets/app_text%202.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MusicTabs(),
  ));
}

class MusicTabs extends StatefulWidget {
  @override
  _MusicTabsState createState() => _MusicTabsState();
}

class _MusicTabsState extends State<MusicTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isLargeScreen = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
      
        // backgroundColor: Colors.black,
        title: AppText(text: "Top"),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.cyan,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.cyan,
          tabs: [
            Tab(text: "Tracks"),
            Tab(text: "Artists"),
            Tab(text: "Albums"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTracksList(),
          _buildArtistsList(),
          _buildAlbumsList(),
        ],
      ),
    );
  }

  Widget _buildTracksList() {
    List<Map<String, String>> tracks = [
      {'number': '#1', 'title': 'Swim', 'artist': 'Chase Atlantic', 'image': 'assets/a1.png'},
      {'number': '#2', 'title': 'Time', 'artist': 'NF', 'image': 'assets/a2.png'},
      {'number': '#3', 'title': 'Movies', 'artist': 'Conan Gray', 'image': 'assets/a3.png'},
      {'number': '#4', 'title': 'lowkey', 'artist': 'NIKI', 'image': 'assets/a4.png'},
      {'number': '#5', 'title': 'Hurt', 'artist': 'NewJeans', 'image': 'assets/a5.png'},
      {'number': '#6', 'title': 'Pink Venom', 'artist': 'BLACKPINK', 'image': 'assets/a1.png'},
      {'number': '#7', 'title': 'moods', 'artist': '11 playlists', 'image': 'assets/a2.png'},
    ];

    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: tracks.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: Colors.black)),
          child: ListTile(
            leading: Image.asset(tracks[index]['image']!, width: 50, height: 50, fit: BoxFit.cover),
            title: Text(tracks[index]['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(tracks[index]['artist']!),
            trailing: Text(tracks[index]['number']!),
          ),
        );
      },
    );
  }

  Widget _buildArtistsList() {
    List<Map<String, String>> artists = [
      {'name': 'Conan Gray', 'image': 'assets/a1.png'},
      {'name': 'Chase Atlantic', 'image': 'assets/a2.png'},
      {'name': 'beabadoobee', 'image': 'assets/a3.png'},
      {'name': 'New Jeans', 'image': 'assets/a4.png'},
      {'name': 'keshi', 'image': 'assets/a5.png'},
    ];

    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: artists.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(artists[index]['image']!),
                radius: 30,
              ),
              title: Text(artists[index]['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
          ],
        );
      },
    );
  }

  Widget _buildAlbumsList() {
    List<Map<String, String>> albums = [
      {'title': 'Superache', 'artist': 'Conan Gray', 'image': 'assets/a1.png'},
      {'title': 'DAWN FM', 'artist': 'The Weeknd', 'image': 'assets/a2.png'},
      {'title': 'Planet Her', 'artist': 'Doja Cat', 'image': 'assets/a3.png'},
      {'title': 'Wiped Out!', 'artist': 'The Neighbourhood', 'image': 'assets/a4.png'},
      {'title': 'Bloom', 'artist': 'Troye Sivan', 'image': 'assets/a5.png'},
    ];

    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: albums.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(albums[index]['image']!, width: 50, height: 50, fit: BoxFit.cover),
          title: Text(albums[index]['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(albums[index]['artist']!),
          trailing: Icon(Icons.more_vert),
        );
      },
    );
  }
}

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
