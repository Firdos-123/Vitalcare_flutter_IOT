import 'package:flutter/material.dart';

class StepsPage extends StatelessWidget {
  const StepsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Steps'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Calories',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text('2,729 cal'),
            const SizedBox(height: 16),
            Container(
              height: 200,
              color: Colors.deepOrangeAccent,
              child: const Center(
                child: Text(
                  'Steps Graph',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Calories Burned'),
            Container(
              height: 150,
              color: Colors.orangeAccent[100],
              child: const Center(
                child: Text('Calories Burned Chart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// TODO Implement this library.