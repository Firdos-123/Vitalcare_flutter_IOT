import 'package:flutter/material.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/view/Caregiver/caregiverpage3.dart';
import 'package:workout_fitness/view/login/login_page2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class CaregiverSignUpPage extends StatefulWidget {
  const CaregiverSignUpPage({super.key});

  @override
  State<CaregiverSignUpPage> createState() => _CaregiverSignUpPageState();
}

class _CaregiverSignUpPageState extends State<CaregiverSignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _relationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        title: const Text(
          'Caregiver Info',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Enter Caregiver Details",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _nameController,
                          decoration: _inputDecoration("Full Name"),
                          validator: (value) => value!.isEmpty ? 'Enter your full name' : null,
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _emailController,
                          decoration: _inputDecoration("Email"),
                          validator: (value) => value!.isEmpty ? 'Enter a valid email' : null,
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _mobileController,
                          keyboardType: TextInputType.phone,
                          decoration: _inputDecoration("Mobile Number"),
                          validator: (value) {
                            if (value!.isEmpty) return 'Enter mobile number';
                            if (value.length != 10) return 'Enter valid 10-digit number';
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _relationController,
                          decoration: _inputDecoration("Relation with Patient"),
                          validator: (value) =>
                          value!.isEmpty ? 'Enter your relation with patient' : null,
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: ElevatedButton(
                            onPressed: _submitForm,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              backgroundColor: TColor.primary,
                            ),
                            child: const Text("Next", style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const LoginPage2()),
                              );
                            },
                            child: const Text(
                              "Already have an account? Log in",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      filled: true,
      fillColor: Colors.grey[200],
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final docRef = await FirebaseFirestore.instance.collection('caregivers').add({
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        'mobile': _mobileController.text.trim(),
        'relation': _relationController.text.trim(),
        'created_at': FieldValue.serverTimestamp(),
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CaregiverPatientInfoPage(caregiverId: docRef.id),
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _relationController.dispose();
    super.dispose();
  }
}
