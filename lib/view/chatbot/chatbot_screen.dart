import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String _selectedLanguage = 'English'; // Store selected language

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(_selectedLanguage == 'English' ? 'Vital' : 'वाइतल', style: const TextStyle(color: Colors.black)),
        actions: [
          DropdownButton<String>(
            value: _selectedLanguage,
            items: <String>['English', 'Hindi', 'Spanish'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedLanguage = newValue!; // Change language
              });
            },
          ),
          IconButton(
            icon: Image.asset('assets/img/img_3.png'), // Use your image here
            onPressed: () {
              // Settings action
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // Use Flutter's back icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildChatMessage(_selectedLanguage == 'English'
                    ? "Hi, I am Vital, your health buddy. How may I help you today?"
                    : _selectedLanguage == 'Hindi'
                    ? "नमस्ते, मी वाइतल आहे, आपला स्वास्थ्य साथी."
                    : "Hola, soy Vital, tu compañero de salud."),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _buildQuickActionButton(_selectedLanguage == 'English'
                        ? "Find my Blood Report"
                        : _selectedLanguage == 'Hindi'
                        ? "माझी रक्त अहवाल शोधा"
                        : "Encuentra mi informe de sangre"),
                    _buildQuickActionButton(_selectedLanguage == 'English'
                        ? "Upload new Prescription"
                        : _selectedLanguage == 'Hindi'
                        ? "नवीन प्रिस्क्रिप्शन अपलोड करा"
                        : "Subir nueva receta"),
                    _buildQuickActionButton(_selectedLanguage == 'English'
                        ? "Show my weekly sugar analysis"
                        : _selectedLanguage == 'Hindi'
                        ? "माझा साप्ताहिक साखर विश्लेषण दाखवा"
                        : "Mostrar mi análisis semanal de azúcar"),
                    _buildQuickActionButton(_selectedLanguage == 'English'
                        ? "Download my Health Summary"
                        : _selectedLanguage == 'Hindi'
                        ? "माझा स्वास्थ्य सारांश डाउनलोड करा"
                        : "Descargar mi resumen de salud"),
                  ],
                ),
                const SizedBox(height: 20),
                _buildSentMessage(_selectedLanguage == 'English'
                    ? "Find my Blood Report"
                    : _selectedLanguage == 'Hindi'
                    ? "माझी रक्त अहवाल शोधा"
                    : "Encuentra mi informe de sangre"),
                _buildReceivedMessage(_selectedLanguage == 'English'
                    ? "Here is your Blood Report from August 2023"
                    : _selectedLanguage == 'Hindi'
                    ? "हे आहे आपला रक्त अहवाल ऑगस्ट 2023 चा"
                    : "Aquí está su informe de sangre de agosto de 2023"),
              ],
            ),
          ),
          _buildMessageInputArea(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/img/menu_home.png', width: 24), // Replace with your image
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/img/menu_schedule.png', width: 24), // Replace with your image
            label: 'Healthlocker',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/img/menu_traning_plan.png", width: 24), // Replace with your image
            label: 'Trackers',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/img/u1.png', width: 24), // Replace with your image
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildSentMessage(String message) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.teal[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(message),
      ),
    );
  }

  Widget _buildReceivedMessage(String message) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(message),
      ),
    );
  }

  Widget _buildQuickActionButton(String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.teal[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      onPressed: () {
        // Handle quick action button
      },
      child: Text(label),
    );
  }

  Widget _buildMessageInputArea() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Write here...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Image.asset('assets/img/img_4.png'), // Replace with your image
            onPressed: () {
              // Send message functionality
            },
          ),
        ],
      ),
    );
  }

  Widget _buildChatMessage(String message) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.teal[50],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(message, style: const TextStyle(color: Colors.black)),
      ),
    );
  }
}

