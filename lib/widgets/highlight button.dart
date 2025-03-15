import 'package:flutter/material.dart';

class HighlightButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const HighlightButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  _HighlightButtonState createState() => _HighlightButtonState();
}

class _HighlightButtonState extends State<HighlightButton> {
  bool isTapped = false;

  void _toggleHighlight() {
    setState(() {
      isTapped = !isTapped;
    });
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleHighlight,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: isTapped ? Colors.blue : Colors.grey[300], // Tap par blue highlight
          borderRadius: BorderRadius.circular(10),
          boxShadow: isTapped
              ? [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: isTapped ? Colors.white : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

///use 
///HighlightButton(
 // text: "Tap Me",
  //onTap: () {
  //  print("Button Clicked!");
  //},
//),