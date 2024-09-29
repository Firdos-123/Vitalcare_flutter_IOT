import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample user data
    String userName = "John Doe"; // Replace with actual user name fetched from profile
    String currentDate = "Friday, July 13"; // Replace with actual date
    int steps = 120; // Replace with actual steps
    String heartRate = "72 BPM"; // Replace with actual heart rate

    return Scaffold(
      appBar: AppBar(
        title: const Text('VitalCare'), // Left Title
        centerTitle: true, // Center the title
        actions: const [
          Icon(Icons.signal_cellular_alt), // Signal Strength
          SizedBox(width: 10),
          Icon(Icons.battery_full), // Battery Status
          SizedBox(width: 10),
          Icon(Icons.notifications), // Notifications
          SizedBox(width: 10),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Greeting
                Text(
                  'Hi, $userName!',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  currentDate,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 20),

                // Health Summary Section
                const Text(
                  'My Health Summary',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Add device logic here
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ), // Button color
                  ),
                  child: const Text('Add a Device'),
                ),
                const SizedBox(height: 20),

                // Activity Cards
                Expanded(
                  child: ListView(
                    children: [
                      _buildActivityCard(
                        context,
                        title: 'Steps',
                        icon: Icons.directions_walk,
                        mainValue: '$steps',
                        progressValue: steps / 8000,
                        metrics: ['102.4 yd', '5.0 kcal', '0.9 min'],
                      ),
                      const SizedBox(height: 20),
                      _buildActivityCard(
                        context,
                        title: 'Sleep',
                        icon: Icons.bed,
                        mainValue: '0h 00m',
                        progressValue: 0,
                        metrics: [],
                      ),
                      const SizedBox(height: 20),
                      _buildActivityCard(
                        context,
                        title: 'Heart Rate',
                        icon: Icons.favorite,
                        mainValue: heartRate,
                        progressValue: 1.0, // Assuming a constant value for demo
                        metrics: [],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Chatbot button
          Positioned(
            bottom: 80,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/chatbot'); // Navigate to the chatbot page
              },
              child: Image.asset(
                'assets/img/chatbot.png', // Replace with your chatbot icon image path
                width: 50,
                height: 50,
              ),
            ),
          ),
        ],
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
        currentIndex: 0, // Change this based on current index
        onTap: (index) {
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

  Widget _buildActivityCard(
      BuildContext context, {
        required String title,
        required IconData icon,
        required String mainValue,
        required double progressValue,
        required List<String> metrics,
      }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 40, color: Colors.blue),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              mainValue,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: progressValue,
              backgroundColor: Colors.grey[300],
              color: Colors.blue,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: metrics
                  .map((metric) => Text(metric, style: const TextStyle(color: Colors.grey)))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
