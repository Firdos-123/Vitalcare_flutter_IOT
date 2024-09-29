import 'package:flutter/material.dart';
import 'package:workout_fitness/view/login/login_page.dart'; // Assuming you have this page defined

import '../../common/color_extension.dart'; // Assuming you have this extension defined

class Step1View extends StatefulWidget {
  const Step1View({super.key});

  @override
  State<Step1View> createState() => _Step1ViewState();
}

class _Step1ViewState extends State<Step1View> {
  @override
  Widget build(BuildContext context) {
    MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        title: Text(
          "Select Language",
          style: TextStyle(
            color: TColor.primary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                children: [
                  _buildLanguageButton("English"),
                  _buildLanguageButton("हिंदी", "Hindi"),
                  _buildLanguageButton("தமிழ்", "Tamil"),
                  _buildLanguageButton("বাংলা", "Bengali"),
                  _buildLanguageButton("मराठी", "Marathi"),
                  _buildMoreButton(),
                ],
              ),
            ),
            const SizedBox(height: 15), // Adjusting spacing at the bottom after removing the button
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageButton(String language, [String? subtitle]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25), // Updated padding
      child: ElevatedButton(
        onPressed: () {
          // Direct navigation to LoginPage on language selection
          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: TColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20), // Matching padding for button content
        ),
        child: Column(
          children: [
            Text(
              language,
              style: const TextStyle(fontSize: 19, color: Colors.black),
            ),
            if (subtitle != null)
              Text(
                subtitle,
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoreButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25), // Updated padding
      child: ElevatedButton(
        onPressed: () {
          // Direct navigation to LoginPage on "More" button click
          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: TColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20), // Matching padding for button content
        ),
        child: const Text(
          'More',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}
