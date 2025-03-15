// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:adaola/marketplace.dart';
import 'package:adaola/saved.dart';
import 'package:adaola/upload.dart';
import 'package:flutter/material.dart';

import 'constants/appcolors.dart';
import 'home.dart';


class usernev extends StatefulWidget {
  const usernev({Key? key}) : super(key: key);
  @override
  State<usernev> createState() => _usernevState();
}

class _usernevState extends State<usernev> {
  int currentValue = 0;
  List allScreens = [
    Home(),
    upload(),
    SavedPlaylistsScreen(),
    MusicHomePage(),
   
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: allScreens[currentValue],
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.music_note_outlined,
            ),
            label: "Upload",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_outlined,
              ),
              label: "Saved"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shop_2_outlined,
              ),
              label: "MarketPlace"),
        ],
        onTap: (index) {
          setState(() {
            currentValue = index;
          });
        },
        currentIndex: (currentValue),
      ),
    );
  }
}
