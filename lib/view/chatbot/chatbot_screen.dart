import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final bool isEnglish; // To toggle between English and another language

  const ChatScreen({Key? key, this.isEnglish = true}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(widget.isEnglish ? 'Vital' : 'वाइतल', style: const TextStyle(color: Colors.black)),
        actions: [
          DropdownButton<String>(
            value: widget.isEnglish ? 'Language' : 'भाषा',
            items: <String>['English', 'Hindi'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              // Handle language change
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // Settings action
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
                _buildChatMessage(widget.isEnglish
                    ? "Hi, I am Vital, your health buddy. How may I help you today?"
                    : "नमस्ते, मी वाइतल आहे, आपला स्वास्थ्य साथी."),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _buildQuickActionButton(
                        widget.isEnglish ? "Find my Blood Report" : "माझी रक्त अहवाल शोधा"),
                    _buildQuickActionButton(
                        widget.isEnglish ? "Upload new Prescription" : "नवीन प्रिस्क्रिप्शन अपलोड करा"),
                    _buildQuickActionButton(
                        widget.isEnglish ? "Show my weekly sugar analysis" : "माझा साप्ताहिक साखर विश्लेषण दाखवा"),
                    _buildQuickActionButton(
                        widget.isEnglish ? "Download my Health Summary" : "माझा स्वास्थ्य सारांश डाउनलोड करा"),
                  ],
                ),
                const SizedBox(height: 20),
                _buildSentMessage(widget.isEnglish
                    ? "Find my Blood Report"
                    : "माझी रक्त अहवाल शोधा"),
                _buildReceivedMessage(widget.isEnglish
                    ? "Here is your Blood Report from August 2023"
                    : "हे आहे आपला रक्त अहवाल ऑगस्ट 2023 चा"),
                _buildSentMessage(widget.isEnglish
                    ? "Give my weekly health analytics"
                    : "माझा साप्ताहिक स्वास्थ्य विश्लेषण द्या"),
                _buildReceivedMessage(widget.isEnglish
                    ? "Here is your Health Summary"
                    : "हे आहे आपला स्वास्थ्य सारांश"),
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_outline),
            label: 'Healthlocker',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'Trackers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Chat bubble for sent message
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

  // Chat bubble for received message
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

  // Quick action button
  Widget _buildQuickActionButton(String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, backgroundColor: Colors.teal[50],
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

  // Message input area with a text field and send button
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
            icon: const Icon(Icons.send, color: Colors.teal),
            onPressed: () {
              // Send message functionality
            },
          ),
        ],
      ),
    );
  }

  // Helper function for chat bot messages
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

void main() => runApp(const MaterialApp(
  home: ChatScreen(),
));
