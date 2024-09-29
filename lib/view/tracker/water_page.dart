import 'package:flutter/material.dart';

class WaterPage extends StatelessWidget {
  const WaterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '525 ml',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const Text('Remaining out of 2000ml'),
            const SizedBox(height: 16),
            Container(
              height: 200,
              color: Colors.blueAccent,
              child: const Center(
                child: Text(
                  'Water Intake Graph or Image',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Add Intake'),
            ),
            const SizedBox(height: 16),
            const Text('Drinking Water Record'),
            // Add intake history list.
          ],
        ),
      ),
    );
  }
}
// TODO Implement this library.