import 'package:flutter/material.dart';
import 'package:workout_fitness/view/home/home_view.dart';

class EHRScreen extends StatelessWidget {
  const EHRScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Electronic Health Records'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.download,
              size: 80.0,
              color: Colors.blue,
            ),
            const SizedBox(height: 16.0),
            Image.asset(
              'assets/document.png', // Replace with your image
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 32.0),
            const Text(
              'You Have Not\nAdded Any Medical\nRecords Yet',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add-record'); // Navigate to Add Record screen
              },
              child: const Text('Add Records'),
            ),
            const SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/chatbot'); // Navigate to Chatbot screen
                  },
                  child: const Text('Chatbot'),
                ),
                const SizedBox(width: 16.0),
                Image.asset(
                  'assets/chatbot.png', // Replace with your image
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
          // Handle bottom navigation taps
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
    );
  }
}
