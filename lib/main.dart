import 'package:flutter/material.dart';

import 'home.dart';
import 'menu.dart';
import 'about.dart';
import 'contact.dart';
import 'x.dart';
import 'facebook.dart';

void main() {
  runApp(const PizzariaApp());
}

class PizzariaApp extends StatelessWidget {
  const PizzariaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizzaria',
      theme: ThemeData(primarySwatch: Colors.red),
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