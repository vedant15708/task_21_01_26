import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Card Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text('Profile Card'),
          centerTitle: true,
          backgroundColor: Colors.blue.shade600,
          foregroundColor: Colors.white,
        ),
        body: const Center(child: ProfileCard()),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade50, Colors.white],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade400, Colors.blue.shade600],
                ),
                boxShadow: [
                  BoxShadow(color: Colors.blue.shade100, blurRadius: 10),
                ],
              ),
              child: const Icon(Icons.person, size: 50, color: Colors.white),
            ),

            const SizedBox(height: 20),
            Text(
              'vedant Pansuriya',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
            ),

            const SizedBox(height: 8),
            Text(
              ' Flutter Developer',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 24),

            buildInfoRow(
              icon: Icons.phone,
              label: 'Phone',
              value: '+91 1234567890',
              color: Colors.green,
            ),

            const SizedBox(height: 16),

            buildInfoRow(
              icon: Icons.email,
              label: 'Email',
              value: 'abc@gmail.com',
              color: Colors.orange,
            ),

            const SizedBox(height: 16),

            buildInfoRow(
              icon: Icons.location_on,
              label: 'Address',
              value: 'ganesh meridian,sola, Ahmedabad',
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
