import 'package:flutter/material.dart';
import 'package:workout_fitness/common/color_extension.dart'; // Your color extension
import 'package:workout_fitness/view/login/login_page2.dart'; // Import LoginPage2

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

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
          'Forgot Password',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Padding for body
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            // New Password input field
            const Text(
              'New Password',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true, // Hide password input
              decoration: InputDecoration(
                hintText: 'Enter your new password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 20),

            // Confirm Password input field
            const Text(
              'Confirm Password',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true, // Hide password input
              decoration: InputDecoration(
                hintText: 'Re-enter your password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 40),

            // Next Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Redirect to LoginPage2 when clicking on the Next button
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage2()), // Navigate to LoginPage2
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
            ),
          ],
        ),
      ),
    );
  }
}
