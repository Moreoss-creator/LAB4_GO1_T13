import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.deepOrange,
              child: Icon(Icons.storefront, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 12),
            const Text(
              'Get in Touch With Us',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            _buildContactCard(
              icon: Icons.location_on,
              iconColor: Colors.red,
              title: 'Address',
              subtitle: '123 Pizza Street, Kuching, Sarawak',
            ),
            const SizedBox(height: 10),
            _buildContactCard(
              icon: Icons.phone,
              iconColor: Colors.green,
              title: 'Phone',
              subtitle: '+60 82 123 456',
            ),
            const SizedBox(height: 10),
            _buildContactCard(
              icon: Icons.email,
              iconColor: Colors.blue,
              title: 'Email',
              subtitle: 'info@pizzaria.com',
            ),
            const SizedBox(height: 10),
            _buildContactCard(
              icon: Icons.access_time,
              iconColor: Colors.orange,
              title: 'Opening Hours',
              subtitle: 'Mon - Sun: 10:00 AM - 10:00 PM',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withAlpha(35),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }
}