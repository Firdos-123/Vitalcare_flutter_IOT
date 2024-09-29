import 'package:flutter/material.dart';
import 'package:workout_fitness/view/HealthLocker/EhrScreen1.dart';

class DoctorRecords extends StatelessWidget {
  const DoctorRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Doctor Records',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset('assets/img/back_fo.png', width: 30), // Back button icon
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ElectronicHealthRecords())); // Go back to previous page
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            Container(
              decoration: BoxDecoration(
                color: Colors.teal[100],
                borderRadius: BorderRadius.circular(30),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Sorting and Filter Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // Sorting functionality
                      },
                      icon: const Icon(Icons.sort_by_alpha, color: Colors.black),
                      label: const Text('A-Z', style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.tealAccent[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Filter functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.tealAccent[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('Filter', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
                const Text(
                  'Doctors',
                  style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Grid for categories
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildCategoryButton(context, 'Cardiology', 'assets/images/cardiology.png'),
                  _buildCategoryButton(context, 'Dermatology', 'assets/images/dermatology.png'),
                  _buildCategoryButton(context, 'General Medicine', 'assets/images/general_medicine.png'),
                  _buildCategoryButton(context, 'Gynecology', 'assets/images/gynecology.png'),
                  _buildCategoryButton(context, 'Odontology', 'assets/images/odontology.png'),
                  _buildCategoryButton(context, 'Oncology', 'assets/images/oncology.png'),
                  _buildCategoryButton(context, 'Ophthalmology', 'assets/images/ophthalmology.png'),
                  _buildCategoryButton(context, 'Orthopedics', 'assets/images/orthopedics.png'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_outline),
            label: 'Healthlocker',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'Trackers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add action for the floating button
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // Widget for creating the category buttons with images and labels
  Widget _buildCategoryButton(BuildContext context, String title, String imagePath) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.tealAccent[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
      ),
      onPressed: () {
        // Add functionality for each button (e.g., navigate to respective doctor record)
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath, // Add the respective image path here
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
