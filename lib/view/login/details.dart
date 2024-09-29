import 'package:flutter/material.dart';
import 'package:workout_fitness/view/login/Aboard.dart';
import 'package:workout_fitness/view/login/login_page1.dart'; // Import the page to navigate back to

class HealthInfoPage extends StatefulWidget {
  const HealthInfoPage({super.key});

  @override
  _HealthInfoPageState createState() => _HealthInfoPageState();
}

class _HealthInfoPageState extends State<HealthInfoPage> {
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
    MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('assets/img/back_fo.png'), // Back icon path
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage1())); // Go back to the previous page
          },
        ),
        title: const Text('Health Info'),
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
            // Next and Remind Me Later buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Patient Page on Next
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WelcomeAboardPage()), // Replace with your patient page
                    );
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
                const SizedBox(width: 20),
                TextButton(
                  onPressed: () {
                    // Handle "Remind Me Later"
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WelcomeAboardPage()), // Replace with your patient page
                    );
                  },
                  child: const Text(
                    'Remind Me Later',
                    style: TextStyle(color: Colors.grey, decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Method to build a text field
  Widget _buildTextField(String labelText, TextEditingController controller, TextInputType inputType) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  // Method to build a dropdown field
  Widget _buildDropdown(String labelText, List<String> items, ValueChanged<String?> onChanged, String? selectedItem) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: labelText,
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
