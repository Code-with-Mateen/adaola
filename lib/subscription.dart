import 'package:adaola/term.dart';
import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  String selectedPlan = "Annual";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.1, // Responsive Image Placeholder
                child: Image(image: AssetImage("assets/subs.png")), // Replace this with your image
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Get Premium",
                style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                "Unlock all the power of this mobile tool and enjoy digital experience like never before!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.black54),
              ),
              SizedBox(height: screenHeight * 0.03),
              _buildPlanOption("Annual", "First 30 days free - Then \$350/Year", true, screenWidth),
              _buildPlanOption("Monthly", "First 7 days free - Then \$24.99/Month", false, screenWidth),
              _buildPlanOption("Weekly", "\$5.99 a week", false, screenWidth),
              SizedBox(height: screenHeight * 0.03),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(screenWidth * 0.8, screenHeight * 0.06),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> term()));
                },
                child: Text("Start 30-day free trial", style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.045)),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "By placing this order, you agree to the Terms of Service and Privacy Policy. Subscription automatically renews unless auto-renew is turned off at least 24-hours before the end of the current period.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: screenWidth * 0.03, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanOption(String plan, String description, bool isBestValue, double screenWidth) {
    bool isSelected = selectedPlan == plan;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPlan = plan;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
        padding: EdgeInsets.all(screenWidth * 0.04),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade50 : Colors.grey.shade200,
          border: Border.all(color: isSelected ? Colors.blue : Colors.transparent, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(plan, style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold, color: Colors.black)),
                  SizedBox(height: screenWidth * 0.01),
                  Text(description, style: TextStyle(fontSize: screenWidth * 0.035, color: Colors.black54)),
                ],
              ),
            ),
            if (isBestValue)
              Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenWidth * 0.01),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text("Best Value", style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.03)),
              ),
          ],
        ),
      ),
    );
  }
}