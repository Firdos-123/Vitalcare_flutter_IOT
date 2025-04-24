import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/view/home/home_view.dart';

class CaregiverInfoPage extends StatefulWidget {
  final String patientId;
  const CaregiverInfoPage({super.key, required this.patientId});

  @override
  State<CaregiverInfoPage> createState() => _CaregiverInfoPageState();
}

class _CaregiverInfoPageState extends State<CaregiverInfoPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _relationController = TextEditingController();

  bool _agreeToTerms = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate() && _agreeToTerms) {
      try {
        await FirebaseFirestore.instance
            .collection('patients')
            .doc(widget.patientId)
            .collection('caregiver_info')
            .doc('details')
            .set({
          'name': _nameController.text,
          'email': _emailController.text,
          'number': _numberController.text,
          'relation': _relationController.text,
          'agreedToTerms': _agreeToTerms,
          'updatedAt': FieldValue.serverTimestamp(),
        });

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(patientId: widget.patientId),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving caregiver info: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete the form and accept the terms')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.primary,
        title: const Text('Caregiver Info', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Fill Caregiver Details',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: _inputDecoration('Full Name'),
                validator: (value) => value!.isEmpty ? 'Enter full name' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: _inputDecoration('Email'),
                validator: (value) => value!.isEmpty ? 'Enter email' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _numberController,
                keyboardType: TextInputType.phone,
                decoration: _inputDecoration('Mobile Number'),
                validator: (value) =>
                value!.isEmpty || value.length != 10 ? 'Enter 10-digit number' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _relationController,
                decoration: _inputDecoration('Relation with Patient'),
                validator: (value) => value!.isEmpty ? 'Enter relation' : null,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: _agreeToTerms,
                    onChanged: (value) {
                      setState(() {
                        _agreeToTerms = value!;
                      });
                    },
                  ),
                  const Expanded(
                    child: Text(
                      "I agree to the terms and conditions to access caregiver features.",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
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
              ),
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(patientId: widget.patientId),
                      ),
                    );
                  },
                  child: const Text(
                    'Already added? Skip',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      filled: true,
      fillColor: Colors.grey[200],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _numberController.dispose();
    _relationController.dispose();
    super.dispose();
  }
}
