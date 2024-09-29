import 'package:flutter/material.dart';
import 'package:workout_fitness/common/color_extension.dart'; // Import your color extension
import 'package:workout_fitness/view/home/home_view.dart'; // Import HomeView
import 'package:workout_fitness/view/login/login_page1.dart';
import 'package:workout_fitness/view/login/account.dart';// Navigate to Account Page
import 'package:workout_fitness/view/login/forgot_password_page.dart'; // Optional for forgot password
import 'package:workout_fitness/view/login/fingerprint_login_page.dart'; // Optional for fingerprint login

class LoginPage2 extends StatelessWidget {
  const LoginPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: TColor.primary, // Set primary color as background
        leading: IconButton(
          icon: Image.asset('assets/img/back_fo.png', width: 30), // Back button icon
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage1())); // Go back to the previous page
          },
        ),
        title: const Text(
          'Log in',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Body padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Welcome text
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 22,
                color: TColor.primary, // Primary color
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Subtitle text
            const Text(
              'Dear User, Please Log in to your account',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 40),

            // Enter your Patient ID text
            const Text(
              'Enter your Patient ID',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),

            // Patient ID input field
            TextField(
              decoration: InputDecoration(
                hintText: 'Patient ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 20),

            // Password input field
            TextField(
              obscureText: true, // Hide password input
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 10),

            // Forgot password text
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  // Navigate to Forgot Password page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ForgotPasswordPage()), // Optional page
                  );
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Login button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the HomeView page after login
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()), // Navigate to HomeView
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
                  'Log in',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Text for login using fingerprint
            const Center(
              child: Text(
                'or log in using fingerprint',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            const SizedBox(height: 10),

            // Fingerprint icon
            Center(
              child: GestureDetector(
                onTap: () {
                  // Handle fingerprint login
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FingerprintPage()), // Optional page
                  );
                },
                child: Image.asset('assets/img/fingerprint_icon.png', width: 50), // Fingerprint icon path
              ),
            ),
            const SizedBox(height: 20),

            // Don't have an account? Sign Up text
            Center(
              child: GestureDetector(
                onTap: () {
                  // Redirect to Account Page for sign up
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AccountPage()), // Navigate to Account Page
                  );
                },
                child: const Text(
                  "Don't have an account? Sign Up",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
