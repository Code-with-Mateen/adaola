import 'package:adaola/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '2ndsplash.dart';

class EqualizerScreen extends StatefulWidget {
  @override
  _EqualizerScreenState createState() => _EqualizerScreenState();
}

class _EqualizerScreenState extends State<EqualizerScreen> {
  List<double> sliderValues = [3, 2, 3, 2, 3, 2];
  String selectedPreset = "Pop";
  bool isPlaying = false;
  double progress = 0.1;
  Duration duration = Duration(minutes: 3, seconds: 40);
  Duration currentPosition = Duration(seconds: 36);
  Timer? _timer;

  void changePreset(String preset) {
    setState(() {
      selectedPreset = preset;
      if (preset == "Normal") {
        sliderValues = [2, 2, 2, 2, 2, 2];
      } else if (preset == "Pop") {
        sliderValues = [3, 2, 3, 2, 3, 2];
      } else if (preset == "Classic") {
        sliderValues = [2, 3, 2, 3, 2, 3];
      } else {
        sliderValues = [2, 2, 2, 2, 2, 2];
      }
    });
  }

  void togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;
    });

    if (isPlaying) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (currentPosition < duration) {
          setState(() {
            currentPosition += Duration(seconds: 1);
            progress = currentPosition.inSeconds / duration.inSeconds;
          });
        } else {
          timer.cancel();
          setState(() {
            isPlaying = false;
          });
        }
      });
    } else {
      _timer?.cancel();
    }
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    return "${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds.remainder(60))}";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text("Equalizer", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), // Adjust padding dynamically
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text "Beat"
            Text("Beat", style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold)),
            SizedBox(height: screenHeight * 0.02),
            LinearProgressIndicator(value: progress, color: Colors.purple),
            SizedBox(height: screenHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatDuration(currentPosition), style: TextStyle(fontSize: screenWidth * 0.04)),
                GestureDetector(
                  onTap: togglePlayPause,
                  child: CircleAvatar(
                    radius: screenWidth * 0.08, // Adjust the size of play/pause button
                    backgroundColor: Colors.blue.shade100,
                    child: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.black,
                      size: screenWidth * 0.06,
                    ),
                  ),
                ),
                Text(formatDuration(duration), style: TextStyle(fontSize: screenWidth * 0.04)),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Text("PRESETS", style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ["Custom", "Normal", "Pop", "Classic"].map((preset) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.015),
                    child: ChoiceChip(
                      label: Text(preset, style: TextStyle(fontSize: screenWidth * 0.04)),
                      selected: selectedPreset == preset,
                      onSelected: (_) => changePreset(preset),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(sliderValues.length, (index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RotatedBox(
                        quarterTurns: -1,
                        child: Slider(
                          value: sliderValues[index],
                          min: 0,
                          max: 5,
                          onChanged: (value) {
                            setState(() {
                              sliderValues[index] = value;
                            });
                          },
                        ),
                      ),
                      Text("${sliderValues[index].toInt()}", style: TextStyle(fontSize: screenWidth * 0.04)),
                    ],
                  );
                }),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Center(
              child: AppButton(btnText: "Continue to generate Song", ontap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> sp2()));
              }),
            ),
             SizedBox(height: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }
}

// class ResponsiveRowCheckbox extends StatefulWidget {
//   @override
//   _ResponsiveRowCheckboxState createState() => _ResponsiveRowCheckboxState();
// }

// class _ResponsiveRowCheckboxState extends State<ResponsiveRowCheckbox> {
//   bool _isChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Checkbox(
//           value: _isChecked,
//           onChanged: (bool? value) {
//             setState(() {
//               _isChecked = value!;
//             });
//           },
//           activeColor: Colors.blue,
//           checkColor: Colors.white,
//         ),
//         SizedBox(width: screenWidth * 0.02),
//         AppText(text: "Vocalization Ai Voice", fontSize: screenWidth * 0.04), // Adjust the text size
//       ],
//     );
//   }
// }
