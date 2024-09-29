import 'package:flutter/material.dart';

class AddNutritionAdvicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Nutrition Advice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Record Name'),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Cardiologist Nutrition Advice Sept 2024',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text('Add Description (if any)'),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Low Cholesterol Foods',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.upload_file),
              label: Text('Save Recipes, etc.'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
