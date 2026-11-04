import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  static const Color cream = Color(0xFFF7F3EA);
  static const Color black = Color(0xFF181818);
  static const Color gold = Color(0xFFB99A65);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      appBar: AppBar(
        title: const Text(
          'CONTACT US',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        backgroundColor: cream,
        foregroundColor: black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Say hello.',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.5,
                color: black,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'WE WOULD LOVE TO HEAR FROM YOU',
              style: TextStyle(
                fontSize: 10,
                letterSpacing: 2,
                fontWeight: FontWeight.w600,
                color: gold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Have a question about our pizzas? '
              'Get in touch with us.',
              style: TextStyle(
                fontSize: 14,
                height: 1.7,
                color: Color(0xFF666666),
              ),
            ),

            const SizedBox(height: 30),

            _contactCard(
              icon: Icons.location_on_outlined,
              title: 'OUR LOCATION',
              detail: 'Kuching, Sarawak, Malaysia',
            ),

            _contactCard(
              icon: Icons.phone_outlined,
              title: 'PHONE NUMBER',
              detail: '+60 82-123 456',
            ),

            _contactCard(
              icon: Icons.email_outlined,
              title: 'EMAIL ADDRESS',
              detail: 'hello@wowpizza.example',
            ),

            _contactCard(
              icon: Icons.access_time_outlined,
              title: 'OPENING HOURS',
              detail: 'Monday - Sunday\n10:00 AM - 10:00 PM',
            ),

            const SizedBox(height: 30),

            const Divider(color: Color(0xFFDCD5C9)),

            const SizedBox(height: 22),

            const Center(
              child: Text(
                'GOOD PIZZA. GREAT CONNECTIONS.',
                style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 1.7,
                  color: Color(0xFF999999),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactCard({
    required IconData icon,
    required String title,
    required String detail,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE8E2D8)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: gold, size: 26),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 10,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                    color: gold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  detail,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
