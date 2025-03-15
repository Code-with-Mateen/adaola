import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';

import 'Notifications.dart';
import 'profile.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<Map<String, String>> albums = [
    {
      'title': 'current favorites',
      'songs': '20 songs',
      'image': 'assets/current_favorites.png',
    },
    {
      'title': '3:00am vibes',
      'songs': '18 songs',
      'image': 'assets/3am_vibes.png',
    },
    {
      'title': 'Lofi Loft',
      'songs': '63 songs',
      'image': 'assets/lofi_loft.png',
    },
    {
      'title': 'rain on my window',
      'songs': '32 songs',
      'image': 'assets/rain_on_my_window.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => profile()));
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 7,
                    child: Image.asset("assets/m3.png"),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello Mateen!",
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
                    ),
                    Text(
                      "Thursday, 26 Jan",
                      style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Slide()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionHeader("Made by you"),
            songGrid([
              SongItem("Indonesian pops", "Nadine Amizah", "assets/1.png"),
              SongItem("90s hiphop mix", "Ghea Indrawari", "assets/2.png"),
              SongItem("Hidupku indah", "James Adam", "assets/3.png"),
            ]),
            sectionHeader("Favorite song’s"),
            songGrid([
              SongItem("Hidupku indah", "James Adam", "assets/3.png"),
              SongItem("Begitu adanya", "Nugroho Alis", "assets/4.png"),
              SongItem("Ya", "Maria", "assets/5.png"),
            ]),
            sectionHeader("Top Albums"),
            albumList(),
          ],
        ),
      ),
    );
  }

  Widget sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            "See all",
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget songGrid(List<SongItem> songs) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: songs.map((song) => songCard(song)).toList(),
      ),
    );
  }

  Widget songCard(SongItem song) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(song.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            song.title,
            style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            song.artist,
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget albumList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: albums.length,
      itemBuilder: (context, index) {
        final album = albums[index];
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              album['image']!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            album['title']!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(album['songs']!),
        );
      },
    );
  }

  Widget uploadBox() {
    return GestureDetector(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.audio,
        );

        if (result != null) {
          String filePath = result.files.single.path!;
          print("Selected file: $filePath");
        } else {
          print("User canceled the picker");
        }
      },
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

class SongItem {
  final String title;
  final String artist;
  final String imagePath;

  SongItem(this.title, this.artist, this.imagePath);
}
