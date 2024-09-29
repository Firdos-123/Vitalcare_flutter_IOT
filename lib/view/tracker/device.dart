import 'package:flutter/material.dart';
import 'heart_rate_page.dart';
import 'blood_pressure_page.dart';
import 'workout_page.dart';
import 'steps_page.dart';
import 'water_page.dart';
import 'alarm_page.dart';
import 'reminder_page.dart';
import 'notifications_page.dart';

class DevicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Device'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Heart Rate'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HeartRatePage()),
              );
            },
          ),
          ListTile(
            title: Text('Blood Pressure'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BloodPressurePage()),
              );
            },
          ),
          ListTile(
            title: Text('Workout'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WorkoutPage()),
              );
            },
          ),
          ListTile(
            title: Text('Steps'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StepsPage()),
              );
            },
          ),
          ListTile(
            title: Text('Water'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WaterPage()),
              );
            },
          ),
          ListTile(
            title: Text('Alarm'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AlarmPage()),
              );
            },
          ),
          ListTile(
            title: Text('Reminder'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReminderPage()),
              );
            },
          ),
          ListTile(
            title: Text('Notifications'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
