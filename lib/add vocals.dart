import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddVocalsScreen extends StatefulWidget {
  @override
  _AddVocalsScreenState createState() => _AddVocalsScreenState();
}

class _AddVocalsScreenState extends State<AddVocalsScreen> {
  String selectedOption = "Ai Generated";

  void _pickAudioFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result != null) {
      String filePath = result.files.single.path!;
      print("Selected Audio File: $filePath");
      // Yahan tum selected file ka processing ya display ka kaam kar sakte ho
    }
  }

  Widget _buildOption(String text) {
    bool isSelected = selectedOption == text;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = text;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
          border: isSelected ? Border.all(color: Colors.blue, width: 2) : Border.all(color: Colors.transparent),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadBox() {
    return GestureDetector(
      onTap: _pickAudioFile,
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400, width: 2, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade100,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Icon(Icons.cloud_upload, size: 40, color: Colors.black54),
            SizedBox(height: 10),
            Text(
              "Upload Your Vocals",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Add Vocals", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
               SizedBox(
        height: MediaQuery.of(context).size.height/20,
      ),
            _buildOption("Ai Generated"),
            _buildOption("User Uploaded"),
              SizedBox(
        height: MediaQuery.of(context).size.height/20,
      ),
            Text(
              "Upload your Vocals",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            SizedBox(height: 10),
            _buildUploadBox(),
          ],
        ),
      ),
    );
  }
}
