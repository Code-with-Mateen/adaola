import 'package:flutter/material.dart';
import 'dart:async';

import 'edit.dart';


class NowPlayingScreen extends StatefulWidget {
  @override
  _NowPlayingScreenState createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen> {
  bool isPlaying = false;
  bool showLyrics = false;
  double progress = 0.0;
  Timer? timer;

  void togglePlay() {
    setState(() {
      isPlaying = !isPlaying;
      if (isPlaying) {
        timer = Timer.periodic(Duration(seconds: 1), (timer) {
          setState(() {
            if (progress < 1.0) {
              progress += 0.01;
            } else {
              timer.cancel();
              isPlaying = false;
            }
          });
        });
      } else {
        timer?.cancel();
      }
    });
  }

  void toggleLyrics() {
    setState(() {
      showLyrics = !showLyrics;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text("Now Playing", style: TextStyle(color: Colors.black)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> EditMusicScreen()));
            },
            child: Text("Edit", style: TextStyle(color: Colors.blue)),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          if (showLyrics) {
            toggleLyrics();
          }
        },
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(child: Icon(Icons.music_note, size: 100)),
                ),
                SizedBox(height: 16),
                IconButton(
                  icon: Icon(Icons.favorite_border, color: Colors.red),
                  onPressed: () {},
                ),
                Text("Freak In Me", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text("Mild Orange", style: TextStyle(fontSize: 16, color: Colors.grey)),
                SizedBox(height: 16),
                LinearProgressIndicator(value: progress, color: Colors.blue),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 16), child: Text("${(progress * 360).toInt() ~/ 60}:${(progress * 360).toInt() % 60}")),
                    IconButton(
                      icon: CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.blue.shade100,
                        child: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: togglePlay,
                    ),
                    Padding(padding: EdgeInsets.only(right: 16), child: Text("3:40")),
                  ],
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: toggleLyrics,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.music_note, color: Colors.black),
                            SizedBox(width: 8),
                            Text("Lyrics", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Icon(showLyrics ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (showLyrics)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: showLyrics ? MediaQuery.of(context).size.height * 0.5 : 0,
                  color: Colors.white.withOpacity(0.9),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lately, I think of you lots\n'Cause my mind's in circles for you\n\nPlease connect the dots\nAnd bring me, bring me to you\n\n'Cause you bring out the freak in me\nIt's only for you",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
