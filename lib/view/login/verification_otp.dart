import 'package:flutter/material.dart';
import 'package:workout_fitness/view/login/account.dart'; // Import your SignIn page here
import 'package:workout_fitness/view/login/details.dart'; // Import your Details page here

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('assets/img/back_fo.png'), // Path to your back icon
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountPage()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Add the image at the top center
            Center(
              child: Image.asset(
                'assets/img/Otp_verification.png', // Path to your verification image
                height: media.height * 0.25,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'OTP Verification',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'We have sent you access code via SMS for Mobile Verification',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) => _otpTextField(context)),
            ),
            const SizedBox(height: 20),
            const Text(
              "Didn't Receive the OTP?",
              style: TextStyle(color: Colors.grey),
            ),
            const Text(
              'Resend Code',
              style: TextStyle(
                  color: Colors.red, decoration: TextDecoration.underline),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HealthInfoPage()), // Navigate to the details page
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: const Color(0xff5DC7D4), // Button color
              ),
              child: const Text(
                'Verify',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // A method to build each OTP text field
  Widget _otpTextField(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 50,
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        keyboardType: TextInputType.number,
        maxLength: 1,
      ),
    );
  }
}
