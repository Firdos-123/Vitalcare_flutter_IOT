import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/view/login/login_page2.dart';
import 'package:flutter/services.dart'; // Import Clipboard package

class WelcomeAboardPage extends StatefulWidget {
  final String email; // Accepting email and password
  final String password;

  const WelcomeAboardPage({super.key, required this.email, required this.password});

  @override
  State<WelcomeAboardPage> createState() => _WelcomeAboardPageState();
}

class _WelcomeAboardPageState extends State<WelcomeAboardPage> {
  String? patientId;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _initializeAndGenerateId();
  }

  Future<void> _initializeAndGenerateId() async {
    try {
      // Ensure Firebase is initialized
      await Firebase.initializeApp();

      final String generatedId =
          'PID_${const Uuid().v4().substring(0, 6).toUpperCase()}';

      // Storing patient info with email and password in Firestore
      await FirebaseFirestore.instance.collection('patients').doc(generatedId).set({
        'patientId': generatedId,
        'email': widget.email,
        'password': widget.password, // Storing password (ensure encryption in real apps)
        'createdAt': FieldValue.serverTimestamp(),
      });

      // Copy the generated Patient ID to clipboard
      await Clipboard.setData(ClipboardData(text: generatedId));

      setState(() {
        patientId = generatedId;
        isLoading = false;
      });

      // Optionally show a snackbar or toast to indicate successful copy action
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Patient ID copied to clipboard')),
      );
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Error occurred: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: TColor.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Welcome Aboard!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : errorMessage != null
            ? Center(child: Text(errorMessage!, style: const TextStyle(color: Colors.red)))
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/patient_id.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: TColor.primary,
              ),
              child: Text(
                'Your Patient ID is: $patientId',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Thank you for signing up. \nWe’re glad to have you with us!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginPage2()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: TColor.primary,
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
