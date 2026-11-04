import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wow_pizza/main.dart';

void main() {
  testWidgets('WOW Pizza Home Page displays correctly', (tester) async {
    await tester.pumpWidget(const WowPizzaApp());

    expect(find.text('WOW.'), findsOneWidget);
    expect(find.text('A little slice\nof happiness.'), findsOneWidget);

    expect(
      find.widgetWithText(OutlinedButton, 'Explore Our Menu'),
      findsOneWidget,
    );
    expect(find.widgetWithText(OutlinedButton, 'Our Story'), findsOneWidget);
    expect(find.widgetWithText(OutlinedButton, 'Get in Touch'), findsOneWidget);
  });
}
