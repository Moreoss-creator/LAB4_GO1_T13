import 'package:flutter/material.dart';

import 'menu_data.dart';
import 'theme.dart';
import 'widgets.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ItaliaAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle('Our Menu'),
            const SizedBox(height: 8.0),
            const Text(
              'Choose a dish from the dropdown, or tap a card, to see its '
              'details, sizes and prices.',
              style: TextStyle(fontSize: 15.0, color: AppColors.textMuted),
            ),
            const SizedBox(height: 18.0),
            const FieldLabel('CHOOSE YOUR DISH'),
            DropdownBox(
              child: DropdownButton<int>(
                key: const Key('item_dropdown'),
                isExpanded: true,
                hint: const Text(
                  'Select a dish',
                  style: TextStyle(fontSize: 18.0),
                ),
                dropdownColor: AppColors.surfaceHigh,
                iconEnabledColor: AppColors.greenLight,
                borderRadius: BorderRadius.circular(12.0),
                items: [
                  for (var i = 0; i < foodItems.length; i++)
                    DropdownMenuItem<int>(
                      value: i,
                      child: Text(
                        foodItems[i].name,
                        key: Key('dish_option_$i'),
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ),
                ],
                onChanged: (value) {
                  if (value == null) return;
                  // Named routes: '0' Vpizza, '1' Chpizza, '2' Fries
                  Navigator.pushNamed(context, value.toString());
                },
              ),
            ),
            const SizedBox(height: 24.0),
            const FieldLabel('OUR FAVOURITES'),
            for (var i = 0; i < foodItems.length; i++) _DishCard(index: i),
          ],
        ),
      ),
    );
  }
}

class _DishCard extends StatelessWidget {
  const _DishCard({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final item = foodItems[index];

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Material(
        color: AppColors.surface,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: const BorderSide(color: AppColors.border),
        ),
        child: InkWell(
          key: Key('dish_card_$index'),
          onTap: () {
            Navigator.pushNamed(context, index.toString());
          },
          child: Row(
            children: [
              Image.asset(
                item.image,
                width: 110.0,
                height: 110.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 14.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      item.tagline,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: AppColors.textMuted,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'From ${item.sizes.first.priceLabel}',
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.greenLight,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.textMuted),
              const SizedBox(width: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}
