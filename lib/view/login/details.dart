import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:workout_fitness/view/home/home_view.dart';
import 'package:workout_fitness/view/login/Aboard.dart';
import 'package:workout_fitness/common/color_extension.dart';
import 'package:workout_fitness/view/login/caregiver_info.dart';// Import the page to navigate back to

class HealthInfoPageDetails extends StatefulWidget {
  final String patientId;

  const HealthInfoPageDetails({super.key, required this.patientId});

  @override
  _HealthInfoPageState createState() => _HealthInfoPageState();
}

class _HealthInfoPageState extends State<HealthInfoPageDetails> {
  // Variables to store form input
  String? selectedGender;
  String? bloodGroup;
  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final familyHistoryController = TextEditingController();
  final allergiesController = TextEditingController();
  final chronicDiseasesController = TextEditingController();
  final currentMedicationsController = TextEditingController();
  final medicalHistoryController = TextEditingController();
  final emergencyContactController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: TColor.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Default back arrow icon
          onPressed: () {
            Navigator.pop(context); // Go back to previous page
          },
        ),
        title: const Text(
          'Health Info',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildDropdown('What is your gender?', ['Male', 'Female', 'Other'], (value) {
              setState(() {
                selectedGender = value;
              });
            }, selectedGender),
            _buildTextField('Age', ageController, TextInputType.number),
            _buildTextField('Weight (kg)', weightController, TextInputType.number),
            _buildTextField('Height (cm)', heightController, TextInputType.number),
            _buildDropdown('Blood Group', ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'], (value) {
              setState(() {
                bloodGroup = value;
              });
            }, bloodGroup),
            _buildTextField('Family History', familyHistoryController, TextInputType.text),
            _buildTextField('Allergies', allergiesController, TextInputType.text),
            _buildTextField('Current Chronic Diseases', chronicDiseasesController, TextInputType.text),
            _buildTextField('Current Medications', currentMedicationsController, TextInputType.text),
            _buildTextField('Any Medical History', medicalHistoryController, TextInputType.text),
            _buildTextField('Emergency Contact No.', emergencyContactController, TextInputType.phone),
            const SizedBox(height: 40),
            // Centered "Next" and "Remind Me Later" buttons
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                  onPressed: () async {
            try {
            await FirebaseFirestore.instance
                .collection('patients')
                .doc(widget.patientId)
                .collection('details')
                .doc('health_info') // You can also use .add({}) if you want auto-generated ID
                .set({
              'patientId': widget.patientId,
            'gender': selectedGender,
            'age': ageController.text,
            'weight': weightController.text,
            'height': heightController.text,
            'bloodGroup': bloodGroup,
            'familyHistory': familyHistoryController.text,
            'allergies': allergiesController.text,
            'chronicDiseases': chronicDiseasesController.text,
            'currentMedications': currentMedicationsController.text,
            'medicalHistory': medicalHistoryController.text,
            'emergencyContact': emergencyContactController.text,
            'updatedAt': FieldValue.serverTimestamp(),
            });

            // Navigate to Home
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CaregiverInfoPage(patientId: widget.patientId),

              ),
            );

            } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to save health info: $e')),
            );
            }
            },

                style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: const Color(0xff5DC7D4), // Button color
                    ),
                    child: const Text('Next', style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                  const SizedBox(height: 20), // Space between the buttons
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(patientId: widget.patientId),
                        ),
                      );
                    },
                    child: const Text(
                      'Remind Me Later',
                      style: TextStyle(color: Colors.grey, decoration: TextDecoration.underline),
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Method to build a text field with a colored box
  Widget _buildTextField(String labelText, TextEditingController controller, TextInputType inputType) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: const Color(0xfff0f0f0), // Background color for the text box
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  // Method to build a dropdown field with a colored box
  Widget _buildDropdown(String labelText, List<String> items, ValueChanged<String?> onChanged, String? selectedItem) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: const Color(0xfff0f0f0), // Background color for the dropdown
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        value: selectedItem,
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
