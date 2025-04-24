import 'package:flutter/material.dart';
import 'package:workout_fitness/view/login/login_page2.dart';
import 'package:workout_fitness/view/login/account.dart';
import '../../common_widget/round_button.dart'; // Make sure to import the RoundButton

class LoginPage1 extends StatelessWidget {
  const LoginPage1({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              "assets/img/on_board_bg.png", // Set your background image path here
              width: media.width,
              height: media.height,
              fit: BoxFit.cover, // Ensures the image covers the entire area
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo in the center (big)
                Image.asset(
                  "assets/img/on_board_1.png", // Replace with your logo image path
                  width: media.width * 0.9, // Adjust size of the logo
                  height: media.width * 0.9, // Making it big, similar to a button
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 50), // Space between logo and buttons

                // "Patient" Button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25), // Updated padding
                  child: RoundButton(
                    title: 'Log In',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage2()));
                    },
                    type: RoundButtonType.primary, // Set button type to primary
                  ),
                ),

                // "Caregiver" Button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25), // Updated padding
                  child: RoundButton(
                    title: 'Sign In',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
                    },
                    type: RoundButtonType.primary, // Set button type to primary
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
