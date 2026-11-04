import 'package:flutter/material.dart';

import 'theme.dart';
import 'widgets.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ItaliaAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                'assets/images/pizza.jpg',
                width: double.infinity,
                height: 220.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20.0),
            const SectionTitle('Our Story'),
            const SizedBox(height: 12.0),
            const Text(
              'Italia Pidja was born from a simple belief: great pizza does '
              'not need shortcuts. We start with ripe tomatoes, fresh '
              'mozzarella, fragrant basil and good olive oil, and we let the '
              'ingredients speak for themselves.',
              style: TextStyle(
                fontSize: 17.0,
                height: 1.5,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12.0),
            const Text(
              'Our dough is prepared fresh every day and every pizza is baked '
              'to order, so what reaches your table is hot, fragrant and made '
              'with care. Whether you are sharing a pizza with family or '
              'enjoying fries with friends, we want every visit to feel like '
              'a meal at an Italian table.',
              style: TextStyle(
                fontSize: 17.0,
                height: 1.5,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 28.0),
            const SectionTitle('What We Stand For'),
            const SizedBox(height: 14.0),
            const InfoCard(
              icon: Icons.eco,
              color: AppColors.greenLight,
              title: 'Real ingredients',
              text:
                  'Quality ingredients, honestly sourced and simply '
                  'prepared.',
            ),
            const InfoCard(
              icon: Icons.local_pizza,
              color: AppColors.white,
              title: 'Authentic recipes',
              text: 'Classic Italian flavours, made here, made fresh.',
            ),
            const InfoCard(
              icon: Icons.groups,
              color: AppColors.redLight,
              title: 'Made to share',
              text: 'Good food tastes better together.',
            ),
            const SizedBox(height: 16.0),
            const QuoteCard(
              quote: '“Real flavours come from real ingredients.”',
              author: 'The Italia Pidja promise',
            ),
            const SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }
}
