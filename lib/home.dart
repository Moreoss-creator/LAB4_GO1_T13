import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Pizzaria',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Store Hero Banner
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=800',
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '🍕 Welcome to Pizzaria!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Hot, fresh & delicious pizza delivered straight to your door.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              const SizedBox(height: 25),

              // Navigation Buttons
              _buildNavButton(
                context: context,
                label: 'Our Menu',
                icon: Icons.restaurant_menu,
                route: '/menu',
              ),
              const SizedBox(height: 12),
              _buildNavButton(
                context: context,
                label: 'About Us',
                icon: Icons.info_outline,
                route: '/about',
              ),
              const SizedBox(height: 12),
              _buildNavButton(
                context: context,
                label: 'Contact Us',
                icon: Icons.contact_phone_outlined,
                route: '/contact',
              ),

              const SizedBox(height: 25),
              const Divider(),
              const SizedBox(height: 10),

              // Social Icons
              const Text(
                'Follow Us On Social Media',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 32,
                    icon: const Icon(Icons.close, color: Colors.black87),
                    onPressed: () => Navigator.pushNamed(context, '/x'),
                  ),
                  const SizedBox(width: 15),
                  IconButton(
                    iconSize: 32,
                    icon: const Icon(Icons.facebook, color: Colors.blue),
                    onPressed: () => Navigator.pushNamed(context, '/facebook'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required String route,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.deepOrange, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          foregroundColor: Colors.deepOrange,
        ),
        onPressed: () => Navigator.pushNamed(context, route),
        icon: Icon(icon),
        label: Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
