import 'package:flutter/material.dart';
import 'package:workout_fitness/view/home/blynk_service.dart';
import 'package:workout_fitness/view/HealthLocker/EhrScreen.dart';
import 'package:workout_fitness/view/chatbot/chatbot_screen.dart';
import 'package:workout_fitness/view/medicine_reminder/reminder_page.dart';

class HomePage extends StatefulWidget {
  final String patientId;

  const HomePage({super.key, required this.patientId});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late VitalService vitalService;
  Map<String, dynamic> vitals = {
    'temperature': '0',
    'humidity': '0',
    'heartbeat': '0',
    'spo2': '0',
  };

  @override
  void initState() {
    super.initState();
    vitalService = VitalService();
    _fetchVitals();
  }

  Future<void> _fetchVitals() async {
    final fetchedVitals = await vitalService.getLatestVitals();
    setState(() {
      vitals = fetchedVitals;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VitalCare', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff54B8D0))),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Image.asset('assets/img/u2.png', width: 30, height: 30),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/img/img_1.png', width: 24, height: 24),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationPage()));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xff54B8D0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(radius: 25, backgroundImage: AssetImage('assets/img/u2.png')),
                  const SizedBox(height: 8),
                  Text('Patient ID: ${widget.patientId}', style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
            _drawerImageItem('assets/img/img_2.png', 'Patient Details', () {}),
            _drawerImageItem('assets/img/img_2.png', 'Health Info', () {}),
            _drawerImageItem('assets/img/img_2.png', 'Add Caregiver', () {}),
            _drawerImageItem('assets/img/img_2.png', 'Change Password', () {}),
            _drawerImageItem('assets/img/img_2.png', 'Logout', () {}),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage('assets/img/u2.png'), radius: 25),
                const SizedBox(width: 10),
                Text('Hi - ${widget.patientId}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {}, // Placeholder for future action
                    icon: const Icon(Icons.download, color: Colors.white),
                    label: const Text('Download Health Info'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff54B8D0),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: _fetchVitals,
                    icon: const Icon(Icons.refresh, color: Colors.white),
                    label: const Text('Refresh'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff54B8D0),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildVitalBox('Temperature', '${vitals['temperature']} °C'),
                  _buildVitalBox('Humidity', '${vitals['humidity']} %'),
                  _buildVitalBox('Heartbeat', '${vitals['heartbeat']} bpm'),
                  _buildVitalBox('SpO2', '${vitals['spo2']} %'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60.0), // Moves FAB upward
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const ChatScreen()));
          },
          child: Image.asset('assets/img/chatbot.png', width: 60, height: 60),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xff54B8D0),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Image.asset('assets/img/menu_home.png', width: 24, height: 24), label: 'Home'),
          BottomNavigationBarItem(icon: Image.asset('assets/img/menu_schedule.png', width: 24, height: 24), label: 'Health Locker'),
          BottomNavigationBarItem(icon: Image.asset('assets/img/dashboard-half.png', width: 24, height: 24), label: 'Medicine Reminder'),
        ],
        onTap: (index) {
          setState(() => _currentIndex = index);
          if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const EHRScreen()));
          } else if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (_) => MedicineReminderPage(patientId: widget.patientId)));
          }
        },
      ),
    );
  }

  Widget _buildVitalBox(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xffE0F7FA),
        border: Border.all(color: const Color(0xff54B8D0), width: 1.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black87)),
        ],
      ),
    );
  }

  Widget _drawerImageItem(String imagePath, String title, VoidCallback onTap) {
    return ListTile(
      leading: Image.asset(imagePath, width: 24, height: 24),
      title: Text(title),
      onTap: onTap,
    );
  }
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Notifications')));
  }
}
