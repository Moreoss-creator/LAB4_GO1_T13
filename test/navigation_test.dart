import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_4/about.dart';
import 'package:lab_4/chpizza.dart';
import 'package:lab_4/contact.dart';
import 'package:lab_4/fries.dart';
import 'package:lab_4/home.dart';
import 'package:lab_4/menu.dart';
import 'package:lab_4/theme.dart';
import 'package:lab_4/vpizza.dart';

// WebView cannot render in a widget test, so routes '3' and '4'
// are mapped to simple placeholder pages.
Widget buildTestApp({Widget home = const Home()}) {
  return MaterialApp(
    theme: buildItaliaTheme(),
    home: home,
    routes: {
      '0': (context) => const Vpizza(),
      '1': (context) => const Chpizza(),
      '2': (context) => const Fries(),
      '3': (context) => const Scaffold(body: Text('twitter-page')),
      '4': (context) => const Scaffold(body: Text('facebook-page')),
      '5': (context) => const MenuPage(),
      '6': (context) => const AboutPage(),
      '7': (context) => const ContactPage(),
    },
  );
}

String? priceText(WidgetTester tester) {
  return tester.widget<Text>(find.byKey(const Key('price_text'))).data;
}

Future<void> openMenuPage(WidgetTester tester) async {
  await tester.pumpWidget(buildTestApp());
  await tester.tap(find.text('Menu'));
  await tester.pumpAndSettle();
}

/// Opens the Menu page and picks a dish from the dropdown.
Future<void> chooseFromMenuDropdown(WidgetTester tester, int index) async {
  await openMenuPage(tester);
  await tester.tap(find.byKey(const Key('item_dropdown')));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Key('dish_option_$index')));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('Home shows the title and 3 menu buttons', (tester) async {
    await tester.pumpWidget(buildTestApp());

    expect(
      find.descendant(
        of: find.byType(AppBar),
        matching: find.text('Italia Pidja'),
      ),
      findsOneWidget,
    );
    expect(find.byType(OutlinedButton), findsNWidgets(3));
    expect(find.text('Menu'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
    expect(find.text('Get in Touch'), findsOneWidget);
  });

  testWidgets('Menu button opens the Menu page (route 5)', (tester) async {
    await openMenuPage(tester);

    expect(find.byType(MenuPage), findsOneWidget);
  });

  testWidgets('About button opens the About page (route 6)', (tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.tap(find.text('About'));
    await tester.pumpAndSettle();

    expect(find.byType(AboutPage), findsOneWidget);
  });

  testWidgets('Get in Touch opens the Contact page (route 7)', (tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.tap(find.text('Get in Touch'));
    await tester.pumpAndSettle();

    expect(find.byType(ContactPage), findsOneWidget);
  });

  testWidgets('Vegetable Pizza opens Vpizza screen (route 0)', (tester) async {
    await chooseFromMenuDropdown(tester, 0);

    expect(find.byType(Vpizza), findsOneWidget);
  });

  testWidgets('Cheese Pizza opens Chpizza screen (route 1)', (tester) async {
    await chooseFromMenuDropdown(tester, 1);

    expect(find.byType(Chpizza), findsOneWidget);
  });

  testWidgets('Fries opens Fries screen (route 2)', (tester) async {
    await chooseFromMenuDropdown(tester, 2);

    expect(find.byType(Fries), findsOneWidget);
  });

  testWidgets('Tapping a menu card opens its dish page', (tester) async {
    await openMenuPage(tester);
    final card = find.byKey(const Key('dish_card_1'));
    await tester.ensureVisible(card);
    await tester.pumpAndSettle();
    await tester.tap(card);
    await tester.pumpAndSettle();

    expect(find.byType(Chpizza), findsOneWidget);
  });

  testWidgets('Twitter logo opens route 3', (tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.tap(find.byKey(const Key('twitter_icon')));
    await tester.pumpAndSettle();

    expect(find.text('twitter-page'), findsOneWidget);
  });

  testWidgets('Facebook logo opens route 4', (tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.tap(find.byKey(const Key('facebook_icon')));
    await tester.pumpAndSettle();

    expect(find.text('facebook-page'), findsOneWidget);
  });

  testWidgets('Size dropdown changes the price', (tester) async {
    await tester.pumpWidget(buildTestApp(home: const Vpizza()));
    expect(priceText(tester), 'RM 18.90'); // Vegetable Pizza, Medium

    await tester.tap(find.byKey(const Key('size_dropdown')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Large (12 inch)').last);
    await tester.pumpAndSettle();

    expect(priceText(tester), 'RM 24.90'); // Vegetable Pizza, Large
  });

  testWidgets('Dish dropdown on a dish page switches the dish', (tester) async {
    await tester.pumpWidget(buildTestApp(home: const Vpizza()));

    await tester.tap(find.byKey(const Key('dish_dropdown')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('dish_option_1')));
    await tester.pumpAndSettle();

    expect(find.byType(Chpizza), findsOneWidget);
    expect(priceText(tester), 'RM 16.90'); // Cheese Pizza, Medium
  });
}
