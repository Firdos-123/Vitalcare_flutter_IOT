import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  TimeOfDay selectedTime = const TimeOfDay(hour: 10, minute: 00);
  bool alarmOn = true;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarm'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => _selectTime(context),
            child: const Text("Select Time"),
          ),
          Text('Selected Time: ${selectedTime.format(context)}'),
          SwitchListTile(
            title: const Text('Alarm On/Off'),
            value: alarmOn,
            onChanged: (bool value) {
              setState(() {
                alarmOn = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
