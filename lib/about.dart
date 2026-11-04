import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const Color cream = Color(0xFFF7F3EA);
  static const Color black = Color(0xFF181818);
  static const Color gold = Color(0xFFB99A65);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      appBar: AppBar(
        backgroundColor: cream,
        foregroundColor: black,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'OUR STORY',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'More than\njust pizza.',
              style: TextStyle(
                fontSize: 36,
                height: 1.15,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.5,
                color: black,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'MADE WITH PASSION. SERVED WITH LOVE.',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.8,
                color: gold,
              ),
            ),

            const SizedBox(height: 25),

            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                'https://images.unsplash.com/photo-1513104890138-7c749659a591',
                height: 210,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 210,
                    color: const Color(0xFFE8E2D8),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.local_pizza,
                      size: 65,
                      color: black,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              'Welcome to WOW Pizza',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: black,
              ),
            ),

            const SizedBox(height: 14),

            const Text(
              'At WOW Pizza, we believe that great pizza '
              'starts with simple, quality ingredients. '
              'Every pizza is carefully handcrafted '
              'to bring you the perfect balance of '
              'freshness, flavour, and comfort.',
              style: TextStyle(
                fontSize: 14,
                height: 1.8,
                color: Color(0xFF626262),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Our passion is to create delicious moments '
              'that bring friends and family together. '
              'Whether you love a classic Margherita '
              'or something bold and cheesy, '
              'there is always something for everyone.',
              style: TextStyle(
                fontSize: 14,
                height: 1.8,
                color: Color(0xFF626262),
              ),
            ),

            const SizedBox(height: 30),

            const Divider(color: Color(0xFFDCD5C9)),

            const SizedBox(height: 22),

            const Row(
              children: [
                Icon(Icons.local_pizza_outlined, color: gold, size: 28),
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    'Fresh ingredients, every day.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: black,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Row(
              children: [
                Icon(Icons.favorite_border, color: gold, size: 28),
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    'Handcrafted with love.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: black,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            const Center(
              child: Text(
                'GOOD FOOD. GOOD MOMENTS.',
                style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 2,
                  color: Color(0xFF999999),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
