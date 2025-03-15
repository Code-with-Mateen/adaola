import 'package:flutter/material.dart';

import 'sharedmusic.dart';

class MusicHomePage extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'title': 'Kpop', 'image': 'assets/s1.png'},
    {'title': 'Indie', 'image': 'assets/s2.png'},
    {'title': 'R&B', 'image': 'assets/s3.png'},
    {'title': 'Pop', 'image': 'assets/s4.png'},
  ];

  final List<Map<String, String>> browseAll = [
    {'title': 'Made for You', 'image': 'assets/s1.png'},
    {'title': 'RELEASED', 'image': 'assets/s2.png'},
    {'title': 'Music Charts', 'image': 'assets/s3.png'},
    {'title': 'Podcasts', 'image': 'assets/s4.png'},
    {'title': 'Bollywood', 'image': 'assets/s5.png'},
    {'title': 'Pop Fusion', 'image': 'assets/s6.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/m3.png'),
                      onBackgroundImageError: (_, __) => print("Error loading profile image"),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello Mateen!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("Thursday, 26 Jan", style: TextStyle(color: Colors.grey)),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Songs, Artists, & More',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3 / 2,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(categories[index]);
                  },
                ),
                SizedBox(height: 20),
                Text("Browse All", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3 / 2,
                  ),
                  itemCount: browseAll.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(browseAll[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Map<String, String> category;
  CategoryCard(this.category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MusicTabs(),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Image.asset(
              category['image']!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey,
                  alignment: Alignment.center,
                  child: Text(
                    category['title']!,
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                category['title']!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
