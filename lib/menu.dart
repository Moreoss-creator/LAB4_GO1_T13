import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of pizza data
    final List<Map<String, String>> pizzas = [
      {
        'name': 'Margherita Pizza',
        'price': '\$8.99',
        'image': 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=150',
      },
      {
        'name': 'Pepperoni Pizza',
        'price': '\$10.99',
        'image': 'https://images.unsplash.com/photo-1628840042765-356cda07504e?w=150',
      },
      {
        'name': 'BBQ Chicken Pizza',
        'price': '\$11.99',
        'image': 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=150',
      },
      {
        'name': 'Veggie Pizza',
        'price': '\$9.99',
        'image': 'https://images.unsplash.com/photo-1585238342024-78d387f4a707?w=150',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Our Menu')),
      body: ListView.builder(
        itemCount: pizzas.length,
        itemBuilder: (context, index) {
          final pizza = pizzas[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              // Pizza Thumbnail Image
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  pizza['image']!,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              // Pizza Name and Price
              title: Text(
                pizza['name']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                pizza['price']!,
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          );
        },
      ),
    );
  }
}
