import 'package:flutter/material.dart';

class ManageAccessPage extends StatelessWidget {
  const ManageAccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Access'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Reports > Dr. Shashank Joshi, MD'),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Blood Test'),
                  SizedBox(height: 4),
                  Text('Dr. Shashank Joshi, viewed 2 mins ago'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text('Share Access'),
            ListTile(
              leading: const Icon(Icons.family_restroom),
              title: const Text('Family'),
              trailing: Switch(value: true, onChanged: (val) {}),
            ),
            ListTile(
              leading: const Icon(Icons.health_and_safety),
              title: const Text('Doctor'),
              trailing: Switch(value: true, onChanged: (val) {}),
            ),
            ListTile(
              leading: const Icon(Icons.policy),
              title: const Text('Insurance'),
              trailing: Switch(value: false, onChanged: (val) {}),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
