import 'package:flutter/material.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/view/login/login_page1.dart';
import 'package:workout_fitness/view/login/verification_otp.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: TColor.primary, // Background color at the top
        leading: IconButton(
          icon: Image.asset('assets/img/back_fo.png', width: 30), // Back button icon
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage1())); // Go back to previous page
          },
        ),
        title: const Text(
          'New Account',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true, // Center the "New Account" text
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildTextField('Full name', false),
            const SizedBox(height: 20),
            _buildTextField('Password', true),
            const SizedBox(height: 20),
            _buildTextField('Email', false),
            const SizedBox(height: 20),
            _buildTextField('Mobile Number', false),
            const SizedBox(height: 20),
            const Text(
              'By continuing, you agree to Terms of Use and Privacy Policy.',
              style: TextStyle(color: Colors.grey),
            ),
            const Spacer(), // Use Spacer to push the Sign Up button to the bottom-middle
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VerifyPage()), // Navigate to LoginPage
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80), // Adjust button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color(0xff5DC7D4), // Sign Up button color
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'or sign up with',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VerifyPage()), // Navigate to LoginPage
                    );
                  },
                  child: Image.asset('assets/img/google1.png', width: 40), // Google icon
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VerifyPage()), // Navigate to LoginPage
                    );
                  },
                  child: Image.asset('assets/img/fingreprint.png', width: 40), // Fingerprint icon
                ),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VerifyPage()), // Navigate to LoginPage
                );
              },
              child: const Center(
                child: Text(
                  'already have an account? Log in',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, bool isPassword) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        labelText: label,
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}
