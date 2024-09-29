import 'package:flutter/material.dart';
import 'package:workout_fitness/common/color_extension.dart'; // Your color extension
import 'package:workout_fitness/view/login/login_page2.dart'; // Import LoginPage2
import 'package:workout_fitness/view/home/home_view.dart'; // Import HomePage or HomeView

class FingerprintPage extends StatelessWidget {
  const FingerprintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: TColor.primary, // Use your primary color
        leading: IconButton(
          icon: Image.asset('assets/img/back_fo.png', width: 30), // Back icon
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage2()), // Redirect to LoginPage2
            );
          },
        ),
        title: const Text(
          'Fingerprint',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Padding for body
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content
          children: [
            // Fingerprint image in white background
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: Image.asset(
                'assets/img/fingreprint.png', // Replace with your fingerprint image path
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 40),

            // Next Button
            ElevatedButton(
              onPressed: () {
                // Navigate to HomePage or HomeView on click
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()), // Redirect to HomePage
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: TColor.primary, // Button background color
              ),
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
