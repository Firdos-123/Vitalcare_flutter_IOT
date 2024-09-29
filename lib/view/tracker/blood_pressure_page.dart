import 'package:flutter/material.dart';

class BloodPressurePage extends StatelessWidget {
  const BloodPressurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Pressure'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Last Measurement',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('120/80 (60)'),
            const Text('6:45 PM, April 18, 2024'),
            const SizedBox(height: 16),
            Container(
              height: 150,
              color: Colors.blue[100],
              child: const Center(
                child: Text('Blood Pressure Pie Chart'),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Last 7 Days'),
            Container(
              height: 150,
              color: Colors.greenAccent[100],
              child: const Center(
                child: Text('7-Day Trend Chart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// TODO Implement this library.