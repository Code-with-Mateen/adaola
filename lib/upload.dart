import 'package:adaola/4.dart';
import 'package:adaola/widgets/app_text%202.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/app_button.dart';

class upload extends StatefulWidget {
  const upload({super.key});

  @override
  State<upload> createState() => _uploadState();
}

class _uploadState extends State<upload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
       appBar: AppBar(
        centerTitle: true,
        title: AppText(text: "Upload"),
        automaticallyImplyLeading: false,
       ),
      body: SingleChildScrollView(
         child: Column(
          children: [
             SizedBox(height: 
             MediaQuery.of(context).size.height/20),
            Row(
              children: [
              Padding(padding: EdgeInsets.only(left: 10,),
              child:   Text(
              "Upload your beat",
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
      
            ),
              ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(padding: EdgeInsets.all(10),
            child: uploadBox(),
            ),
           
            SizedBox(
              height: MediaQuery.of(context).size.height/10,
            ),
            Center(
              child: AppButton(btnText: "Create your Song", ontap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Forth()));
              }),
            ), SizedBox(
              height: MediaQuery.of(context).size.height/10,
            ),
          ],
         ),
     ) );
  }
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cloud_upload_outlined, size: 40, color: Colors.black54),
              const SizedBox(height: 10),
              Text(
                "Upload Your Beat",
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }

