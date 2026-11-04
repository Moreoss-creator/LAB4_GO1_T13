import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  static const Color cream = Color(0xFFF7F3EA);
  static const Color black = Color(0xFF181818);
  static const Color gold = Color(0xFFB99A65);

  @override
  Widget build(BuildContext context) {
    final pizzas = [
      {
        'name': 'Classic Margherita',
        'description': 'Tomato, mozzarella, fresh basil',
        'price': 'RM 18.90',
        'image': 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002',
      },
      {
        'name': 'Pepperoni Supreme',
        'description': 'Pepperoni, mozzarella, tomato sauce',
        'price': 'RM 24.90',
        'image': 'https://images.unsplash.com/photo-1628840042765-356cda07504e',
      },
      {
        'name': 'BBQ Chicken',
        'description': 'Grilled chicken, BBQ sauce, onions',
        'price': 'RM 26.90',
        'image': 'https://images.unsplash.com/photo-1513104890138-7c749659a591',
      },
      {
        'name': 'Four Cheese',
        'description': 'Mozzarella, cheddar, parmesan, blue cheese',
        'price': 'RM 28.90',
        'image': 'https://images.unsplash.com/photo-1571407970349-bc81e7e96d47',
      },
    ];

    return Scaffold(
      backgroundColor: cream,
      appBar: AppBar(
        backgroundColor: cream,
        foregroundColor: black,
        elevation: 0,
        title: const Text(
          'OUR MENU',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text(
            'Made with love.',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: -1,
              color: black,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Discover our handcrafted pizzas, '
            'prepared fresh just for you.',
            style: TextStyle(
              fontSize: 13,
              height: 1.6,
              color: Color(0xFF777777),
            ),
          ),

          const SizedBox(height: 25),

          ...pizzas.map((pizza) {
            return Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFE8E2D8)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                    child: Image.network(
                      pizza['image']!,
                      width: double.infinity,
                      height: 175,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 175,
                          color: const Color(0xFFE8E2D8),
                          child: const Center(
                            child: Icon(
                              Icons.local_pizza,
                              size: 55,
                              color: black,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(17),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pizza['name']!,
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: black,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          pizza['description']!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF777777),
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          pizza['price']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: gold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),

          const SizedBox(height: 10),

          const Center(
            child: Text(
              'FRESHLY PREPARED. ALWAYS DELICIOUS.',
              style: TextStyle(
                fontSize: 10,
                letterSpacing: 1.5,
                color: Color(0xFF999999),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
