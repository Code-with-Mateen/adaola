import 'package:adaola/widgets/app_text%202.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedPlaylistsScreen extends StatelessWidget {
  final List<Map<String, String>> playlists = [
    {"title": "Superache", "artist": "Conan Gray", "image": "assets/a1.png"},
    {"title": "DAWN FM", "artist": "The Weeknd", "image": "assets/a2.png"},
    {"title": "Planet Her", "artist": "Doja Cat", "image": "assets/a3.png"},
    {"title": "Wiped Out!", "artist": "The Neighbourhood", "image": "assets/a4.png"},
    {"title": "Bloom", "artist": "Troye Sivan", "image": "assets/a5.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:AppText(text: "Saved"),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/30,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.favorite, color: Colors.white, size: 22),
                ),
                SizedBox(width: 10),
                Text(
                  "Your Liked Playlists",
                  style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Recently added",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.blue),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: playlists.length,
                itemBuilder: (context, index) {
                  final playlist = playlists[index];
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        playlist['image']!,
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.width * 0.15,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      playlist['title']!,
                      style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      playlist['artist']!,
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                    ),
                    trailing: Icon(Icons.more_vert, color: Colors.black),
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
