import 'package:flutter/material.dart';

class ReminderPage extends StatelessWidget {
  const ReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminder'),
      ),
      body: Column(
        children: [
          const ListTile(
            title: Text('Yoga'),
            subtitle: Text('Thursday, 6 September'),
            trailing: Icon(Icons.notifications),
          ),
          const ListTile(
            title: Text('Sleep'),
            subtitle: Text('Saturday, 8 September'),
            trailing: Icon(Icons.notifications),
          ),
          const ListTile(
            title: Text('Water'),
            subtitle: Text('Monday, 10 September'),
            trailing: Icon(Icons.notifications),
          ),
          const ListTile(
            title: Text('Walk'),
            subtitle: Text('Monday, 10 September'),
            trailing: Icon(Icons.notifications),
          ),
          const ListTile(
            title: Text('Wake Up'),
            subtitle: Text('Wednesday, 12 September'),
            trailing: Icon(Icons.notifications),
          ),
          const ListTile(
            title: Text('Medicine'),
            subtitle: Text('Wednesday, 12 September'),
            trailing: Icon(Icons.notifications),
          ),
          ElevatedButton(
            onPressed: () {
              // Add new reminder action
            },
            child: const Text('Add Reminder'),
          ),
        ],
      ),
    );
  }
}
