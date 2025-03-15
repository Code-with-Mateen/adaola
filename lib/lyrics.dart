import 'package:flutter/material.dart';

class ChangeLyricsScreen extends StatefulWidget {
  @override
  _ChangeLyricsScreenState createState() => _ChangeLyricsScreenState();
}

class _ChangeLyricsScreenState extends State<ChangeLyricsScreen> {
  bool isExpanded = false;
  TextEditingController lyricsController = TextEditingController();

  List<Map<String, dynamic>> lyrics = [
    {"text": "Lately, I think of you lots", "bold": true},
    {"text": "'Cause my mind's in circles for you", "bold": true},
    {"text": "Please", "bold": true},
    {"text": "connect the dots", "bold": false},
    {"text": "And bring me, bring me to you", "bold": false},
    {"text": "'Cause you bring out the freak in me", "bold": false},
    {"text": "It's only for you", "bold": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Change Lyrics", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
             Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Save", style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              SizedBox(
        height: MediaQuery.of(context).size.height/10,
      ),
            TextField(
              controller: lyricsController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Enter Text to change lyrics",
                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
        height: MediaQuery.of(context).size.height/20,
      ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.music_note, color: Colors.black54),
                        SizedBox(width: 5),
                        Text("Lyrics", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Spacer(),
                        Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: Colors.black54),
                      ],
                    ),
                    if (isExpanded) ...lyrics.map((line) {
                      return Text(
                        line["text"],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: line["bold"] ? FontWeight.bold : FontWeight.normal,
                          color: line["bold"] ? Colors.black : Colors.black54,
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      )
    );
  }
}
