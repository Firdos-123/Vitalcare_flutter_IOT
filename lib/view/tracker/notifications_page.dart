import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool notificationsOn = true;
  bool soundOn = true;
  bool vibrateOn = false;
  bool messagesOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: Text('Notifications (On/Off)'),
            value: notificationsOn,
            onChanged: (bool value) {
              setState(() {
                notificationsOn = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Sound'),
            value: soundOn,
            onChanged: (bool value) {
              setState(() {
                soundOn = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Sound Call'),
            value: vibrateOn,
            onChanged: (bool value) {
              setState(() {
                vibrateOn = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Messages'),
            value: messagesOn,
            onChanged: (bool value) {
              setState(() {
                messagesOn = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
