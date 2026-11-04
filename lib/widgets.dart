import 'package:flutter/material.dart';

import 'theme.dart';

/// App bar used on every page: brand name, X and Facebook logos, tricolour line.
class ItaliaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ItaliaAppBar({super.key, this.currentRoute});

  /// Route key of the page showing this bar ('3' = X, '4' = Facebook),
  /// so the logo of the page you are already on does nothing.
  final String? currentRoute;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 4);

  Widget _logo(String asset, double size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      child: Image.asset(asset, fit: BoxFit.contain, width: size, height: size),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      surfaceTintColor: Colors.transparent,
      foregroundColor: Colors.white,
      bottom: const TricolorBar(),
      title: Row(
        children: [
          const Icon(Icons.local_pizza, color: AppColors.redLight, size: 26.0),
          const SizedBox(width: 8.0),
          const Text(
            'Italia Pidja',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          GestureDetector(
            key: const Key('twitter_icon'),
            onTap: currentRoute == '3'
                ? null
                : () {
                    Navigator.pushNamed(context, '3'); // X / Twitter login
                  },
            child: _logo('assets/images/twitter.jpg', 30.0),
          ),
          const SizedBox(width: 12.0),
          GestureDetector(
            key: const Key('facebook_icon'),
            onTap: currentRoute == '4'
                ? null
                : () {
                    Navigator.pushNamed(context, '4'); // Facebook login
                  },
            child: _logo('assets/images/facebook.png', 30.0),
          ),
        ],
      ),
    );
  }
}

/// Section heading with a small red accent bar.
class SectionTitle extends StatelessWidget {
  const SectionTitle(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4.0,
          height: 26.0,
          decoration: BoxDecoration(
            color: AppColors.red,
            borderRadius: BorderRadius.circular(2.0),
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

/// Rounded card with an icon, a title and a short text.
class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.text,
  });

  final IconData icon;
  final Color color;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: AppColors.surfaceHigh,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24.0),
          ),
          const SizedBox(width: 14.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 15.0,
                    height: 1.4,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// A "wise words" quote with a coloured bar on the left.
class QuoteCard extends StatelessWidget {
  const QuoteCard({
    super.key,
    required this.quote,
    required this.author,
    this.accent = AppColors.green,
  });

  final String quote;
  final String author;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(left: BorderSide(color: accent, width: 4.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            quote,
            style: const TextStyle(
              fontSize: 20.0,
              height: 1.35,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            author,
            style: const TextStyle(fontSize: 14.0, color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}

/// Small grey heading above a form field (for example DISH, SIZE).
class FieldLabel extends StatelessWidget {
  const FieldLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13.0,
          letterSpacing: 1.0,
          color: AppColors.textMuted,
        ),
      ),
    );
  }
}

/// Rounded dark box that wraps a DropdownButton.
class DropdownBox extends StatelessWidget {
  const DropdownBox({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: AppColors.border),
      ),
      child: DropdownButtonHideUnderline(child: child),
    );
  }
}
