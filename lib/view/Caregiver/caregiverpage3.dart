import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/view/Caregiver/caregiverpage4.dart';

class CaregiverPatientInfoPage extends StatefulWidget {
  final String caregiverId;

  const CaregiverPatientInfoPage({super.key, required this.caregiverId});

  @override
  State<CaregiverPatientInfoPage> createState() => _CaregiverPatientInfoPageState();
}

class _CaregiverPatientInfoPageState extends State<CaregiverPatientInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _patientNameController = TextEditingController();
  final TextEditingController _patientEmailController = TextEditingController();
  final TextEditingController _patientMobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void dispose() {
    _patientNameController.dispose();
    _patientEmailController.dispose();
    _patientMobileController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _createPatientAccount() async {
    try {
      print("Creating user...");
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _patientEmailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      final User? user = userCredential.user;
      final String patientId = 'PID_${const Uuid().v4().substring(0, 6).toUpperCase()}';
      print("User created. UID: ${user?.uid}, PatientID: $patientId");

      // Get caregiver info
      final caregiverDoc = await _firestore.collection('caregivers').doc(widget.caregiverId).get();
      final caregiverName = caregiverDoc.exists ? caregiverDoc['name'] ?? '' : '';
      final caregiverEmail = caregiverDoc.exists ? caregiverDoc['email'] ?? '' : '';

      // Save to main 'patients' collection
      await _firestore.collection('patients').doc(patientId).set({
        'patientId': patientId,
        'name': _patientNameController.text.trim(),
        'email': _patientEmailController.text.trim(),
        'password': _passwordController.text.trim(),
        'mobile': _patientMobileController.text.trim(),
        'caregiverName': caregiverName,
        'caregiverEmail': caregiverEmail,
        'caregiverId': widget.caregiverId,
        'createdAt': FieldValue.serverTimestamp(),
      });

      // Save to caregiver’s nested collection
      if (user != null) {
        await _firestore
            .collection('caregivers')
            .doc(widget.caregiverId)
            .collection('patients')
            .doc(user.uid)
            .set({
          'name': _patientNameController.text.trim(),
          'email': _patientEmailController.text.trim(),
          'mobile': _patientMobileController.text.trim(),
          'uid': user.uid,
          'patientId': patientId,
          'created_at': FieldValue.serverTimestamp(),
        });
      }

      print("Navigating to final page...");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CaregiverFinalPage(patientId: patientId),
        ),
      );
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Account creation failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        title: const Text('Patient Details', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _patientNameController,
                decoration: const InputDecoration(labelText: 'Patient Name'),
                validator: (value) => value!.isEmpty ? 'Enter patient name' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _patientEmailController,
                decoration: const InputDecoration(labelText: 'Patient Email'),
                validator: (value) => value!.isEmpty ? 'Enter email' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _patientMobileController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Patient Mobile Number'),
                validator: (value) => value!.length != 10 ? 'Enter valid 10-digit number' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) => value!.length < 8 ? 'Password must be at least 8 characters' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Confirm Password'),
                validator: (value) => value != _passwordController.text ? 'Passwords do not match' : null,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _createPatientAccount();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColor.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Create Account', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
