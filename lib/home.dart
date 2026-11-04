import 'package:flutter/material.dart';

import 'theme.dart';
import 'widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ItaliaAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _NavRow(),
            SizedBox(height: 20.0),
            _Hero(),
            SizedBox(height: 20.0),
            _AssistantCard(),
            SizedBox(height: 28.0),
            SectionTitle('Why Italia Pidja'),
            SizedBox(height: 14.0),
            InfoCard(
              icon: Icons.eco,
              color: AppColors.greenLight,
              title: 'Real ingredients',
              text:
                  'Ripe tomatoes, fresh mozzarella and fragrant basil. '
                  'Nothing artificial, nothing hidden.',
            ),
            InfoCard(
              icon: Icons.schedule,
              color: AppColors.white,
              title: 'Made fresh, every day',
              text:
                  'Our dough is prepared daily and every pizza is baked '
                  'to order.',
            ),
            InfoCard(
              icon: Icons.favorite,
              color: AppColors.redLight,
              title: 'Italian passion',
              text: 'Simple recipes and honest flavours, served with a smile.',
            ),
            SizedBox(height: 16.0),
            QuoteCard(
              quote: '“Real flavours come from real ingredients.”',
              author: 'The Italia Pidja promise',
            ),
            SizedBox(height: 12.0),
            QuoteCard(
              quote: '“A tavola non si invecchia.”',
              author: 'Italian proverb: at the table, no one grows old',
              accent: AppColors.red,
            ),
            SizedBox(height: 28.0),
            Center(
              child: Text(
                '© 2026 Italia Pidja  ·  Authentic Italian pizza, made here.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.0, color: AppColors.textMuted),
              ),
            ),
            SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }
}

/// The three navigation buttons: Menu, About, Get in Touch.
class _NavRow extends StatelessWidget {
  const _NavRow();

  @override
  Widget build(BuildContext context) {
    // Horizontal scrollable row for the three OutlinedButtons
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _NavButton(
            label: 'Menu',
            route: '5',
            background: AppColors.green,
            foreground: Colors.white,
          ),
          SizedBox(width: 10.0),
          _NavButton(
            label: 'About',
            route: '6',
            background: AppColors.white,
            foreground: AppColors.background,
          ),
          SizedBox(width: 10.0),
          _NavButton(
            label: 'Get in Touch',
            route: '7',
            background: AppColors.red,
            foreground: Colors.white,
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.label,
    required this.route,
    required this.background,
    required this.foreground,
  });

  final String label;
  final String route;
  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: background,
        foregroundColor: foreground,
        side: BorderSide(color: background, width: 2.0),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      ),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: foreground,
        ),
      ),
    );
  }
}

/// Big photo with the welcome message on top.
class _Hero extends StatelessWidget {
  const _Hero();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/pizza.jpg',
            width: double.infinity,
            height: 300.0,
            fit: BoxFit.cover,
          ),
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x1A000000), AppColors.overlay],
                ),
              ),
            ),
          ),
          const Positioned(
            left: 20.0,
            right: 20.0,
            bottom: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Authentic Italian pizza,\nmade here.',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    height: 1.15,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Real flavours come from real ingredients.',
                  style: TextStyle(fontSize: 17.0, color: AppColors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AssistantCard extends StatelessWidget {
  const _AssistantCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(
                Icons.support_agent,
                color: AppColors.greenLight,
                size: 32.0,
              ),
              SizedBox(width: 12.0),
              Expanded(
                child: Text(
                  "Hi, I'm the Pizza Assistant, what can I help you order?",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14.0),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14.0),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '5');
              },
              child: const Text(
                'Browse our menu',
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
