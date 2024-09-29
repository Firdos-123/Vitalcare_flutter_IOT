import 'package:flutter/material.dart';
import 'package:workout_fitness/view/HealthLocker/AddDoctorRecordsPage.dart';

class HealthRecordsPage extends StatelessWidget {
  const HealthRecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Electronic Health Records'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Doctor\'s Name'),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Dr. Shashank Joshi',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Doctor\'s Description'),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Cardiologist',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Availability (Days/Time)'),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Mon-Sat | 9 AM - 4 PM',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Specializations'),
            const SizedBox(height: 8),
            // This is where the icons for the specializations go.
            const Wrap(
              spacing: 10,
              children: [
                Chip(label: Text('Cardiology')),
                Chip(label: Text('Neurology')),
                Chip(label: Text('Oncology')),
                Chip(label: Text('Pediatrics')),
                // Add more specialization chips
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddDoctorRecordsPage()),
                );
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
