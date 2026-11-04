import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color cream = Color(0xFFF7F3EA);
  static const Color black = Color(0xFF181818);
  static const Color gold = Color(0xFFB99A65);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // APP HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'WOW.',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1.5,
                      color: black,
                    ),
                  ),
                  const Text(
                    'ARTISAN PIZZA',
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 2,
                      color: black,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 35),

              // SMALL HEADING
              const Text(
                'FRESHLY MADE, EVERY DAY',
                style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.w600,
                  color: gold,
                ),
              ),

              const SizedBox(height: 12),

              // MAIN TITLE
              const Text(
                'A little slice\nof happiness.',
                style: TextStyle(
                  fontSize: 37,
                  height: 1.15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.4,
                  color: black,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Handcrafted pizza. Simple ingredients. '
                'Extraordinary flavour.',
                style: TextStyle(
                  fontSize: 13,
                  height: 1.6,
                  color: Color(0xFF686868),
                ),
              ),

              const SizedBox(height: 28),

              // PIZZA IMAGE
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  'https://images.unsplash.com/photo-1513104890138-7c749659a591',
                  width: double.infinity,
                  height: 210,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 210,
                      color: const Color(0xFFE9E1D4),
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

              // NAVIGATION BUTTONS
              _navigationButton(
                context,
                title: 'Explore Our Menu',
                route: '/menu',
              ),

              const SizedBox(height: 10),

              _navigationButton(context, title: 'Our Story', route: '/about'),

              const SizedBox(height: 10),

              _navigationButton(
                context,
                title: 'Get in Touch',
                route: '/contact',
              ),

              const SizedBox(height: 35),

              // DIVIDER
              const Divider(color: Color(0xFFDCD5C9)),

              const SizedBox(height: 18),

              // SOCIAL MEDIA
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'FOLLOW OUR JOURNEY',
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 1.5,
                      color: Color(0xFF777777),
                    ),
                  ),

                  Row(
                    children: [
                      IconButton(
                        tooltip: 'Twitter / X',
                        onPressed: () {
                          Navigator.pushNamed(context, '/x');
                        },
                        icon: const Text(
                          '𝕏',
                          style: TextStyle(fontSize: 23, color: black),
                        ),
                      ),
                      IconButton(
                        tooltip: 'Facebook',
                        onPressed: () {
                          Navigator.pushNamed(context, '/facebook');
                        },
                        icon: const Icon(
                          Icons.facebook,
                          color: black,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // FOOTER
              const Center(
                child: Text(
                  '© 2026 WOW PIZZA',
                  style: TextStyle(
                    fontSize: 9,
                    letterSpacing: 2,
                    color: Color(0xFF999999),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // REUSABLE OUTLINED BUTTON
  Widget _navigationButton(
    BuildContext context, {
    required String title,
    required String route,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: black,
          side: const BorderSide(color: Color(0xFFBDB5A8), width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
          padding: const EdgeInsets.symmetric(horizontal: 18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const Icon(Icons.arrow_outward, size: 18, color: gold),
          ],
        ),
      ),
    );
  }
}
