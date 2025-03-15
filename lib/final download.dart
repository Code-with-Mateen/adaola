import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

import 'sp3.dart';

class finaldownload extends StatefulWidget {
  @override
  _finaldownloadState createState() => _finaldownloadState();
}

class _finaldownloadState extends State<finaldownload> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    _audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
      });
    });

    _audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        position = p;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlayPause() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(UrlSource('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'));
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Downloads', style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> sp3()));
            },
            child: Text('Upload', style: GoogleFonts.poppins(color: Colors.blue)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(Icons.music_note, size: 80, color: Colors.blue),
            ),
            SizedBox(height: 20),
            Text('grainy days', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('moody.', style: GoogleFonts.poppins(color: Colors.grey)),
            SizedBox(height: 10),
            IconButton(
              icon: Icon(Icons.favorite, color: Colors.red),
              onPressed: () {},
            ),
            SizedBox(height: 10),
            Text('Freak In Me', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Mild Orange', style: GoogleFonts.poppins(color: Colors.grey)),
            SizedBox(height: 20),
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble().clamp(0, duration.inSeconds.toDouble()),
              onChanged: (value) {
                _audioPlayer.seek(Duration(seconds: value.toInt()));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_formatDuration(position), style: GoogleFonts.poppins()),
                Text(_formatDuration(duration), style: GoogleFonts.poppins()),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, size: 40),
                  onPressed: _togglePlayPause,
                ),
              ],
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Previous Download', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSongTile('current favorites', '20 songs'),
                  _buildSongTile('3:00am vibes', '18 songs'),
                  _buildSongTile('Lofi Loft', '63 songs'),
                  _buildSongTile('rain on my window', '32 songs'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSongTile(String title, String subtitle) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        color: Colors.grey[300], // Placeholder color
        child: Icon(Icons.image, color: Colors.grey),
      ),
      title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: GoogleFonts.poppins(color: Colors.grey)),
    );
  }
}
