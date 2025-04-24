import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For Clipboard
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/view/Caregiver/caregiverpage5.dart';
import 'package:workout_fitness/view/login/login_page2.dart';

class CaregiverFinalPage extends StatefulWidget {
  final String patientId;

  const CaregiverFinalPage({super.key, required this.patientId});

  @override
  State<CaregiverFinalPage> createState() => _CaregiverFinalPageState();
}

class _CaregiverFinalPageState extends State<CaregiverFinalPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _copyPatientIdToClipboard();
    });
    print("Navigated to CaregiverFinalPage with ID: ${widget.patientId}");
  }

  void _copyPatientIdToClipboard() {
    Clipboard.setData(ClipboardData(text: widget.patientId));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Patient ID copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: TColor.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Welcome Aboard!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
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
              onPressed: _copyPatientIdToClipboard,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: TColor.primary,
              ),
              child: Text(
                'Your Patient ID is: ${widget.patientId}',
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
                  MaterialPageRoute(builder: (context) => const CarLoginPage2()),
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
