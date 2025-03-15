// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'constants/appcolors.dart'; // Add this for date formatting

class Slide extends StatelessWidget {
  const Slide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Example notifications with date info
    final notifications = [
      {'message': 'Your Song has been uploaded successfully', 'date': DateTime.now()},
      {'message': 'Your Subcription has been activated successfully', 'date': DateTime.now().subtract(Duration(days: 1))},
      {'message': 'Your Song has been uploaded successfully', 'date': DateTime.now().subtract(Duration(days: 3))},
      {'message': 'Your Song has been uploaded successfully', 'date': DateTime.now().subtract(Duration(days: 5))},
      {'message': 'Your Song has been uploaded successfully', 'date': DateTime.now().subtract(Duration(days: 10))},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(66),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 7, 0),
          child: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
            ),
            title: Text(
              'Notifications',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: ListView(
        children: buildNotificationList(notifications),
      ),
    );
  }

  // Helper function to categorize and build the notification list
  List<Widget> buildNotificationList(List<Map<String, dynamic>> notifications) {
    List<Widget> widgets = [];

    final today = DateTime.now();
    today.subtract(Duration(days: 1));

    bool addedTodayHeader = false;
    bool addedYesterdayHeader = false;
    bool addedLast7DaysHeader = false;

    notifications.sort((a, b) => (b['date']).compareTo(a['date'])); // Sort descending by date

    for (var notification in notifications) {
      DateTime date = notification['date'];

      if (isToday(date) && !addedTodayHeader) {
        widgets.add(buildHeader('Today'));
        addedTodayHeader = true;
      } else if (isYesterday(date) && !addedYesterdayHeader) {
        widgets.add(buildHeader('Yesterday'));
        addedYesterdayHeader = true;
      } else if (isLast7Days(date) && !addedLast7DaysHeader) {
        widgets.add(buildHeader('Last 7 Days'));
        addedLast7DaysHeader = true;
      } else if (!isToday(date) && !isYesterday(date) && !isLast7Days(date) && widgets.isEmpty) {
        widgets.add(buildHeader('Older'));
      }

      widgets.add(buildNotificationItem(notification['message'], formatDate(date)));
      widgets.add(Divider(color: Color(0xffD8D8D8)));
    }

    return widgets;
  }

  // Header Widget
  Widget buildHeader(String text) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }

  // Notification Item Widget
  Widget buildNotificationItem(String message, String date) {
    return Slidable(
      key: ValueKey(message),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: const [
          SlidableAction(
            onPressed: doNothing,
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(Icons.notifications, color: Colors.black),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.black),
            ),
            Text(
              date,
              style: GoogleFonts.poppins(fontSize: 10, color: AppColors.primaryColor),
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Image.asset("assets/bluedot.png"),
        ),
      ),
    );
  }

  // Helper Functions for Date Checks
  bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month && date.day == now.day;
  }

  bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(Duration(days: 1));
    return date.year == yesterday.year && date.month == yesterday.month && date.day == yesterday.day;
  }

  bool isLast7Days(DateTime date) {
    final sevenDaysAgo = DateTime.now().subtract(Duration(days: 7));
    return date.isAfter(sevenDaysAgo) && !isToday(date) && !isYesterday(date);
  }

  // Date Formatting
  String formatDate(DateTime date) {
    return DateFormat('MMMM dd, yyyy at hh:mm a').format(date);
  }
}

// Do nothing function for Slidable actions
void doNothing(BuildContext context) {}
