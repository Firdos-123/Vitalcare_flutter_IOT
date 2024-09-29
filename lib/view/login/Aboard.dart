import 'package:flutter/material.dart';
import 'package:workout_fitness/common/color_extension.dart'; // Assuming you have this color extension
import 'package:workout_fitness/view/login/login_page2.dart';
import 'package:workout_fitness/view/login/details.dart';// Redirect to LoginPage2

class WelcomeAboardPage extends StatelessWidget {
  const WelcomeAboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: TColor.primary, // Your primary color
        leading: IconButton(
          icon: Image.asset('assets/img/back_fo.png', width: 30), // Path to your back icon
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HealthInfoPage()));// Go back to previous screen
          },
        ),
        title: const Text(
          'Welcome Aboard!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true, // Center the title
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Overall page padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            // Placeholder for the image (replace with your asset)
            Image.asset(
              'assets/img/patient_id.png', // Replace with your welcome image path
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 40),

            // Button displaying Patient ID
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: TColor.primary, // Button color
              ),
              child: const Text(
                'Your Patient ID is: PID_123',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            // Thank you text
            const Text(
              'Thank you for signing up. \nWe’re glad to have you with us!',
              textAlign: TextAlign.center, // Center the text
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const Spacer(), // Pushes the "Next" button to the bottom

            // "Next" button
            ElevatedButton(
              onPressed: () {
                // Navigate to LoginPage2
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage2()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: TColor.primary, // Button color
              ),
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
