/// One size option of a dish (for example Medium, 9 inch, RM 18.90).
class FoodSize {
  const FoodSize(this.label, this.detail, this.price);

  final String label;
  final String detail;
  final double price;

  String get priceLabel => 'RM ${price.toStringAsFixed(2)}';
}

/// One dish on the menu.
class FoodItem {
  const FoodItem({
    required this.name,
    required this.tagline,
    required this.description,
    required this.image,
    required this.ingredients,
    required this.sizes,
  });

  final String name;
  final String tagline;
  final String description;
  final String image;
  final List<String> ingredients;
  final List<FoodSize> sizes;
}

/// The single source of truth for names, details and prices.
const List<FoodItem> foodItems = [
  FoodItem(
    name: 'Vegetable Pizza',
    tagline: 'Fresh from the garden',
    description:
        'A colourful pizza topped with roasted peppers, mushrooms, black '
        'olives and sweet red onions on a rich tomato base, finished with '
        'fresh basil.',
    image: 'assets/images/vegetable.jpg',
    ingredients: [
      'Tomato sauce',
      'Mozzarella',
      'Bell peppers',
      'Mushrooms',
      'Black olives',
      'Red onion',
      'Fresh basil',
    ],
    sizes: [
      FoodSize('Small', '7 inch', 14.90),
      FoodSize('Medium', '9 inch', 18.90),
      FoodSize('Large', '12 inch', 24.90),
    ],
  ),
  FoodItem(
    name: 'Cheese Pizza',
    tagline: 'Simple. Classic. Honest.',
    description:
        'Our signature pizza: stretchy mozzarella and tangy tomato sauce with '
        'a drizzle of olive oil, topped with parmesan and fresh basil. Real '
        'flavours from real ingredients.',
    image: 'assets/images/cheese_pizza.jpg',
    ingredients: [
      'Tomato sauce',
      'Mozzarella',
      'Parmesan',
      'Olive oil',
      'Fresh basil',
    ],
    sizes: [
      FoodSize('Small', '7 inch', 12.90),
      FoodSize('Medium', '9 inch', 16.90),
      FoodSize('Large', '12 inch', 22.90),
    ],
  ),
  FoodItem(
    name: 'Fries',
    tagline: 'Golden and crispy',
    description:
        'Potatoes fried until golden and crisp, tossed with sea salt and a '
        'touch of rosemary. The perfect side for any pizza.',
    image: 'assets/images/French_Fries.jpg',
    ingredients: ['Potatoes', 'Sea salt', 'Rosemary', 'Vegetable oil'],
    sizes: [
      FoodSize('Small', '100 g', 5.90),
      FoodSize('Medium', '150 g', 7.90),
      FoodSize('Large', '220 g', 9.90),
    ],
  ),
];
