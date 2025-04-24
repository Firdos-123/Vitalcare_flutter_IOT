import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/view/Caregiver/caregiver_page2.dart';
import 'package:workout_fitness/view/home/home_view.dart'; // HomePage after successful login

 // Navigate to LoginPage1
 // Navigate to Account Page
import 'package:workout_fitness/view/login/forgot_password_page.dart'; // Optional for forgot password

class CarLoginPage2 extends StatefulWidget {
  const CarLoginPage2({super.key});

  @override
  _LoginPage2State createState() => _LoginPage2State();
}

class _LoginPage2State extends State<CarLoginPage2> {
  final _formKey = GlobalKey<FormState>();
  final _patientIdController = TextEditingController();
  final _passwordController = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: TColor.primary, // Set primary color as background
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Default back button
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CaregiverSignUpPage()));
          },
        ),
        title: const Text(
          'Log in',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // Welcome text
                Align(
                  alignment: Alignment.topLeft, // Align text to the left
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue, // Primary color
                      fontWeight: FontWeight.bold,
                    ),
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
                TextFormField(
                  controller: _patientIdController,
                  decoration: InputDecoration(
                    hintText: 'Patient ID',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Patient ID';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Password input field
                TextFormField(
                  controller: _passwordController,
                  obscureText: true, // Hide password input
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
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
                        MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final patientId = _patientIdController.text;
                        final password = _passwordController.text;

                        try {
                          // Query Firestore to find the patient by Patient ID
                          final patientSnapshot = await _firestore
                              .collection('patients')
                              .where('patientId', isEqualTo: patientId)
                              .get();

                          if (patientSnapshot.docs.isNotEmpty) {
                            final patientDoc = patientSnapshot.docs.first;

                            // Check if password matches
                            final storedPassword = patientDoc['password'];

                            if (storedPassword == password) {
                              // Correct credentials, navigate to HealthInfoPage with the Firestore doc ID
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(patientId: patientDoc['patientId']),
                                ),
                              );

                            }
                            else {
                              // Incorrect password
                              _showErrorDialog('Incorrect password. Please try again.');
                            }
                          } else {
                            // No patient found with the provided Patient ID
                            _showErrorDialog('No patient found with the provided Patient ID.');
                          }
                        } catch (e) {
                          _showErrorDialog('An error occurred. Please try again.');
                        }
                      }
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

                // Text for login using Google and fingerprint
                const Center(
                  child: Text(
                    'or log in using Google or fingerprint',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 10),

                // Google and Fingerprint icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Handle Google login
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage(patientId: '')),
                        );
                      },
                      child: Image.asset('assets/img/google1.png', width: 40),
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        // Handle fingerprint login
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage(patientId: 'PID_3115D3')),
                        );
                      },
                      child: Image.asset('assets/img/fingreprint.png', width: 40),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Don't have an account? Sign Up text
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Redirect to Account Page for sign up
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CaregiverSignUpPage()),
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
        ),
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _patientIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
