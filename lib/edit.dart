import 'package:adaola/subscription.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:share_plus/share_plus.dart';

import 'add vocals.dart';
import 'change instrumental.dart';
import 'lyrics.dart';

class EditMusicScreen extends StatefulWidget {
  @override
  _EditMusicScreenState createState() => _EditMusicScreenState();
}

class _EditMusicScreenState extends State<EditMusicScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool isLiked = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();

    _audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        _duration = d;
      });
    });

    _audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        _position = p;
      });
    });
  }

  void _togglePlayPause() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(UrlSource("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  void _shareSong() {
    Share.share("Check out this song: https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3");
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Edit", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border, color: isLiked ? Colors.red : Colors.black),
          onPressed: _toggleLike,
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SubscriptionScreen()));
          }, icon: Icon(Icons.save_alt, color: Colors.black))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.02),
              Container(
                height: screenHeight * 0.3,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Icon(Icons.music_note, size: 100, color: Colors.blue.shade700),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text("grainy days", style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold)),
              Text("moody.", style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.grey)),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 50,
                    icon: Icon(isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill, color: Colors.blue),
                    onPressed: _togglePlayPause,
                  ),
                ],
              ),
              Slider(
                min: 0,
                max: _duration.inSeconds.toDouble(),
                value: _position.inSeconds.toDouble(),
                onChanged: (value) async {
                  await _audioPlayer.seek(Duration(seconds: value.toInt()));
                },
              ),
              Text(
                "${_position.inMinutes}:${(_position.inSeconds % 60).toString().padLeft(2, '0')} / ${_duration.inMinutes}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}"
              ),
              SizedBox(height: screenHeight * 0.03),
              
              _buildOption(Icons.music_note, "Change Instrumentals", instrumental()),
              _buildOption(Icons.graphic_eq, "Add/Remove Vocals", AddVocalsScreen()),
              _buildOption(Icons.text_fields, "Change Lyrics", ChangeLyricsScreen()),
              _buildOption(Icons.download, "Download", SubscriptionScreen()), // Yahan required download screen laga sakte ho
              _buildOption(Icons.share, "Share", null, isShare: true), // Share ke liye alag logic
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(IconData icon, String label, Widget? nextScreen, {bool isShare = false}) {
    return InkWell(
      onTap: () {
        if (isShare) {
          _shareSong();
        } else if (nextScreen != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => nextScreen));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(icon, color: Colors.black54),
            SizedBox(width: 10),
            Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
