import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pizzaria/about.dart';

void main() {
  testWidgets('Navigates to About page and back to Home', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/': (context) => Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/about'),
                child: const Text('Open About'),
              ),
            ),
          ),
          '/about': (context) => const AboutPage(),
        },
      ),
    );

    await tester.tap(find.text('Open About'));
    await tester.pumpAndSettle();
    expect(find.text('About Us'), findsOneWidget);

    await tester.tap(find.text('Back to Home'));
    await tester.pumpAndSettle();
    expect(find.text('Open About'), findsOneWidget);
  });
}
