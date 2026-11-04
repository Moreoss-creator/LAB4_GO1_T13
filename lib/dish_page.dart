import 'package:flutter/material.dart';

import 'menu_data.dart';
import 'theme.dart';
import 'widgets.dart';

/// Detail page for one dish: photo, price, sizes, ingredients.
/// Vpizza, Chpizza and Fries (the lab pages) all use this page.
class DishPage extends StatefulWidget {
  const DishPage({super.key, required this.itemIndex});

  /// Index of the dish in [foodItems] (0 = Vegetable, 1 = Cheese, 2 = Fries).
  final int itemIndex;

  @override
  State<DishPage> createState() => _DishPageState();
}

class _DishPageState extends State<DishPage> {
  int _sizeIndex = 1; // Medium is the default size

  @override
  Widget build(BuildContext context) {
    final item = foodItems[widget.itemIndex];

    return Scaffold(
      appBar: const ItaliaAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FieldLabel('DISH'),
            DropdownBox(
              child: DropdownButton<int>(
                key: const Key('dish_dropdown'),
                isExpanded: true,
                value: widget.itemIndex,
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
                  if (value == null || value == widget.itemIndex) return;
                  // Named routes: '0' Vpizza, '1' Chpizza, '2' Fries
                  Navigator.pushReplacementNamed(context, value.toString());
                },
              ),
            ),
            const SizedBox(height: 14.0),
            const FieldLabel('SIZE'),
            DropdownBox(
              child: DropdownButton<int>(
                key: const Key('size_dropdown'),
                isExpanded: true,
                value: _sizeIndex,
                dropdownColor: AppColors.surfaceHigh,
                iconEnabledColor: AppColors.greenLight,
                borderRadius: BorderRadius.circular(12.0),
                items: [
                  for (var i = 0; i < item.sizes.length; i++)
                    DropdownMenuItem<int>(
                      value: i,
                      child: Text(
                        '${item.sizes[i].label} (${item.sizes[i].detail})',
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ),
                ],
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    _sizeIndex = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20.0),
            _DetailsCard(item: item, sizeIndex: _sizeIndex),
          ],
        ),
      ),
    );
  }
}

class _DetailsCard extends StatelessWidget {
  const _DetailsCard({required this.item, required this.sizeIndex});

  final FoodItem item;
  final int sizeIndex;

  @override
  Widget build(BuildContext context) {
    final selected = item.sizes[sizeIndex];

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            item.image,
            width: double.infinity,
            height: 220.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 2.0),
                          Text(
                            item.tagline,
                            style: const TextStyle(
                              fontSize: 15.0,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          selected.priceLabel,
                          key: const Key('price_text'),
                          style: const TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.greenLight,
                          ),
                        ),
                        Text(
                          selected.label,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 14.0),
                Text(
                  item.description,
                  style: const TextStyle(
                    fontSize: 16.0,
                    height: 1.45,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 18.0),
                const Text(
                  'INGREDIENTS',
                  style: TextStyle(
                    fontSize: 13.0,
                    letterSpacing: 1.0,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 8.0),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    for (final name in item.ingredients)
                      Chip(
                        label: Text(
                          name,
                          style: const TextStyle(fontSize: 14.0),
                        ),
                        backgroundColor: AppColors.surfaceHigh,
                        side: const BorderSide(color: AppColors.border),
                      ),
                  ],
                ),
                const SizedBox(height: 18.0),
                const Text(
                  'SIZES & PRICES',
                  style: TextStyle(
                    fontSize: 13.0,
                    letterSpacing: 1.0,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 6.0),
                for (var i = 0; i < item.sizes.length; i++)
                  _PriceRow(size: item.sizes[i], highlighted: i == sizeIndex),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  const _PriceRow({required this.size, required this.highlighted});

  final FoodSize size;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: 16.0,
      fontWeight: highlighted ? FontWeight.bold : FontWeight.normal,
      color: highlighted ? Colors.white : AppColors.textMuted,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Expanded(child: Text('${size.label} · ${size.detail}', style: style)),
          Text(size.priceLabel, style: style),
        ],
      ),
    );
  }
}
