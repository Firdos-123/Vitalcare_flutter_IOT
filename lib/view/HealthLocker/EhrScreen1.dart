import 'package:flutter/material.dart';
import 'package:workout_fitness/view/home/home_view.dart';

class ElectronicHealthRecords extends StatelessWidget {
  const ElectronicHealthRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal, // Background color matching the image
        title: const Text(
          'Electronic Health Records',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(patientId: 'PID_3115D3',))); // Navigate back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              'assets/img/ehr_icon.png', // Replace with your asset path
              width: 80,
              height: 80,
            ),
            const SizedBox(height: 20),
            // Build all the buttons for different records
            _buildRoundedButton(context, 'Reports, Scans'),
            _buildRoundedButton(context, 'Doctor Records'),
            _buildRoundedButton(context, 'Insurance Records'),
            _buildRoundedButton(context, 'Appointments'),
            _buildRoundedButton(context, 'Medicines Records'),
            _buildRoundedButton(context, 'Vaccination Records'),
            _buildRoundedButton(context, 'Emergency Contacts'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/img/menu_home.png', width: 30), // Replace with your home icon image path
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/img/menu_schedule.png', width: 30), // Replace with your health locker icon image path
            label: 'Health Locker',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/img/menu_traning_plan.png", width: 30), // Replace with your tracker icon image path
            label: 'Trackers',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/img/u1.png', width: 30), // Replace with your profile icon image path
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          // Handle navigation to respective pages based on index
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/dashboard'); // Navigate to dashboard
              break;
            case 1:
              Navigator.pushNamed(context, '/healthlocker'); // Navigate to health locker
              break;
            case 2:
              Navigator.pushNamed(context, '/trackers'); // Navigate to trackers
              break;
            case 3:
              Navigator.pushNamed(context, '/profile'); // Navigate to profile
              break;
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for adding new record
          print('Floating Action Button Pressed');
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // Widget for creating the rounded rectangular buttons
  Widget _buildRoundedButton(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black, backgroundColor: Colors.tealAccent[100], // Text color
          minimumSize: const Size(double.infinity, 50), // Button height
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Rounded edges
          ),
        ),
        onPressed: () {
          // Handle button press (You can add navigation or actions here)
          print('$title button pressed');
        },
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(
  home: ElectronicHealthRecords(),
));
