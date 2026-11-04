import 'package:flutter/material.dart';

import 'about.dart';
import 'chpizza.dart';
import 'contact.dart';
import 'facebook.dart';
import 'fries.dart';
import 'home.dart';
import 'menu.dart';
import 'theme.dart';
import 'twitter.dart';
import 'vpizza.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Italia Pidja',
      debugShowCheckedModeBanner: false,
      theme: buildItaliaTheme(),
      home: const Home(),
      routes: {
        // Keys 0-4 follow the lab slide table
        '0': (context) => const Vpizza(),
        '1': (context) => const Chpizza(),
        '2': (context) => const Fries(),
        '3': (context) => const Twitter(),
        '4': (context) => const Facebook(),
        // Extra pages required by the lab guide
        '5': (context) => const MenuPage(),
        '6': (context) => const AboutPage(),
        '7': (context) => const ContactPage(),
      },
    );
  }
}
