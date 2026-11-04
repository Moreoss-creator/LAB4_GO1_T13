import 'package:flutter/material.dart';

import 'home.dart';
import 'menu.dart';
import 'about.dart';
import 'contact.dart';
import 'x.dart';
import 'facebook.dart';

void main() {
  runApp(const WowPizzaApp());
}

class WowPizzaApp extends StatelessWidget {
  const WowPizzaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WOW Pizza',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB99A65)),
        useMaterial3: true,
      ),

      initialRoute: '/',

      routes: {
        '/': (context) => const HomePage(),
        '/menu': (context) => const MenuPage(),
        '/about': (context) => const AboutPage(),
        '/contact': (context) => const ContactPage(),
        '/x': (context) => const XPage(),
        '/facebook': (context) => const FacebookPage(),
      },
    );
  }
}
