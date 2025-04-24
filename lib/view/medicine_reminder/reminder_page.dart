import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Blynk IoT HTTP API endpoint and your Auth Token
const String authToken = 'M9zmgSEv40k0CO_T1rbRMTBUHAlfNWAb';
const String updateEndpoint = 'https://blynk.cloud/external/api/update';

/// Format a TimeOfDay as "HH:mm" (24‑hour)
String fmt24(TimeOfDay t) {
  final dt = DateTime(0, 0, 0, t.hour, t.minute);
  return '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
}

/// Send start & end times to virtual pin V0
Future<void> setTimeToBlynk(String startTime, String endTime) async {
  final uri = Uri.parse(
    '$updateEndpoint?token=$authToken&V0=$startTime,$endTime',
  );
  final resp = await http.get(uri);
  debugPrint('setTime → $uri → ${resp.statusCode}');
}

/// Toggle alarm ON/OFF on virtual pin V1
Future<void> triggerAlarmInBlynk(bool alarmOn) async {
  final uri = Uri.parse(
    '$updateEndpoint?token=$authToken&V1=${alarmOn ? 1 : 0}',
  );
  final resp = await http.get(uri);
  debugPrint('triggerAlarm → $uri → ${resp.statusCode}');
}

class MedicineReminderPage extends StatefulWidget {
  final String patientId;
  const MedicineReminderPage({super.key, required this.patientId});

  @override
  State<MedicineReminderPage> createState() => _MedicineReminderPageState();
}

class _MedicineReminderPageState extends State<MedicineReminderPage> {
  String _selectedMedicine = 'Paracetamol';
  bool _showOtherInput = false;
  final _customMedicineController = TextEditingController();
  int _currentIndex = 2;
  TimeOfDay? _selectedStartTime;
  TimeOfDay? _selectedEndTime;
  bool _alarmOn = false;
  final _selectedDays = List.generate(7, (_) => false);

  final _medicineOptions = [
    'Paracetamol',
    'Ibuprofen',
    'Amoxicillin',
    'Cetirizine',
    'Metformin',
    'Other'
  ];
  final _daysOfWeek = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];

  void _pickStartTime() async {
    final t = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (t != null) setState(() => _selectedStartTime = t);
  }

  void _pickEndTime() async {
    final t = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (t != null) setState(() => _selectedEndTime = t);
  }

  void _toggleAlarm() {
    setState(() => _alarmOn = !_alarmOn);
    triggerAlarmInBlynk(_alarmOn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Reminder', style: TextStyle(color: Color(0xff54B8D0))),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, '/home'),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/img/u2.png'),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/img/img_1.png', width: 24, height: 24),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationPage())),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Select Medicine:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              DropdownButton<String>(
                value: _selectedMedicine,
                isExpanded: true,
                onChanged: (v) => setState(() {
                  _selectedMedicine = v!;
                  _showOtherInput = v == 'Other';
                }),
                items: _medicineOptions.map((m) => DropdownMenuItem(value: m, child: Text(m))).toList(),
              ),
              if (_showOtherInput) ...[
                const SizedBox(height: 8),
                TextField(
                  controller: _customMedicineController,
                  decoration: const InputDecoration(labelText: 'Enter Medicine Name'),
                ),
              ],
              const SizedBox(height: 24),
              GestureDetector(
                onTap: _pickStartTime,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xffE0F7FA),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xff54B8D0), width: 1.5),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _selectedStartTime != null
                        ? 'Start: ${fmt24(_selectedStartTime!)}'
                        : 'Tap to set start time',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: _pickEndTime,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xffE0F7FA),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xff54B8D0), width: 1.5),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _selectedEndTime != null
                        ? 'End: ${fmt24(_selectedEndTime!)}'
                        : 'Tap to set end time',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text('Select Days:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(7, (i) {
                  return FilterChip(
                    label: Text(_daysOfWeek[i]),
                    selected: _selectedDays[i],
                    onSelected: (v) => setState(() => _selectedDays[i] = v),
                  );
                }),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_selectedStartTime == null || _selectedEndTime == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select both start and end times')),
                    );
                    return;
                  }
                  _toggleAlarm();
                  final s = fmt24(_selectedStartTime!);
                  final e = fmt24(_selectedEndTime!);
                  setTimeToBlynk(s, e);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _alarmOn ? Colors.red : Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  _alarmOn ? 'Turn Off Alarm' : 'Turn On Alarm',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xff54B8D0),
        unselectedItemColor: Colors.grey,
        onTap: (i) {
          setState(() => _currentIndex = i);
          if (i == 0) Navigator.pushReplacementNamed(context, '/home');
          if (i == 1) Navigator.pushReplacementNamed(context, '/locker');
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.lock), label: 'Health Locker'),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Medicine Reminder'),
        ],
      ),
    );
  }
}

/// Dummy NotificationPage
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Notifications')));
  }
}
