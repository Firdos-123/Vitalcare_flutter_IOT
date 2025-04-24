import 'package:flutter/material.dart';
import 'device.dart';  // Import DevicePage to navigate

class AddDevicePage extends StatelessWidget {
  const AddDevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Device'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Please Select Your Device From The List',
                style: TextStyle(fontSize: 18)),
          ),

          ListTile(
            title: const Text('Paired Devices'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => _navigateToDevicePage(context),
                  child: ListTile(
                    leading: Image.asset('assets/images/tbd_watch.png',
                        width: 50, height: 50),
                    title: const Text('TBD Watch'),
                  ),
                ),
                GestureDetector(
                  onTap: () => _navigateToDevicePage(context),
                  child: ListTile(
                    leading: Image.asset('assets/images/apple_watch_ultra.png',
                        width: 50, height: 50),
                    title: const Text('Apple Watch Ultra'),
                  ),
                ),
                GestureDetector(
                  onTap: () => _navigateToDevicePage(context),
                  child: ListTile(
                    leading: Image.asset('assets/images/fitbit_versa.png',
                        width: 50, height: 50),
                    title: const Text('Fitbit Versa'),
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            title: const Text('Available Devices'),
            subtitle: GestureDetector(
              onTap: () => _navigateToDevicePage(context),
              child: ListTile(
                leading: Image.asset('assets/images/mv09_watch.png',
                    width: 50, height: 50),
                title: const Text('MV09 Watch'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToDevicePage(BuildContext context) {
    // Navigate to the DevicePage when a device is selected
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DevicePage()),
    );
  }
}
