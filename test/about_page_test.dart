import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pizzaria/about.dart';

void main() {
  testWidgets('About page shows story, hours and back button skrr', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: AboutPage()));

    expect(find.text('About Us'), findsOneWidget);
    expect(find.text('The Pizzaria Story'), findsOneWidget);
    expect(find.text('Opening Hours'), findsOneWidget);
    expect(find.text('Back to Home'), findsOneWidget);
  });
}
