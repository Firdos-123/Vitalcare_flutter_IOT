import 'package:flutter/material.dart';

class HeartRatePage extends StatelessWidget {
  const HeartRatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heart Rate'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Heart Rate',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Check Your Heart Rate Data'),
            const SizedBox(height: 16),
            Container(
              height: 200,
              color: Colors.redAccent,
              child: const Center(
                child: Text(
                  'Heart Rate Graph',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Heart Rate Zone'),
            // Add more details here based on your image (e.g., stats, graphs).
          ],
        ),
      ),
    );
  }
}
// TODO Implement this library.