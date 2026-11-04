import 'package:flutter/material.dart';

/// FONT: change this ONE name when you add your own font.
/// The font files themselves are declared in pubspec.yaml under `fonts:`
/// (we will set that up together later).
const String appFontFamily = 'ItaliaFont';

/// Use FontStyle.normal here if you do not want italic text.
const FontStyle appFontStyle = FontStyle.italic;

/// Italian flag colours + a dark, professional charcoal palette.
class AppColors {
  const AppColors._();

  // Italian flag
  static const Color green = Color(0xFF009246);
  static const Color white = Color(0xFFF1F2F1);
  static const Color red = Color(0xFFCE2B37);

  // Lighter versions of green/red that read well as text/icons on dark
  static const Color greenLight = Color(0xFF3DBE7C);
  static const Color redLight = Color(0xFFE8606B);

  // Dark charcoal palette (not pure black)
  static const Color background = Color(0xFF16191D);
  static const Color surface = Color(0xFF20252B);
  static const Color surfaceHigh = Color(0xFF2A3037);
  static const Color border = Color(0xFF3A414A);
  static const Color textMuted = Color(0xFFB4BBC4);
  static const Color overlay = Color(0xE616191D);
}

/// Three thin stripes (green / white / red) shown under every app bar.
class TricolorBar extends StatelessWidget implements PreferredSizeWidget {
  const TricolorBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(4);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: ColoredBox(color: AppColors.green, child: SizedBox(height: 4)),
        ),
        Expanded(
          child: ColoredBox(color: AppColors.white, child: SizedBox(height: 4)),
        ),
        Expanded(
          child: ColoredBox(color: AppColors.red, child: SizedBox(height: 4)),
        ),
      ],
    );
  }
}

/// Dark theme with a charcoal background and one font for the whole app.
ThemeData buildItaliaTheme() {
  final base = ThemeData(
    brightness: Brightness.dark,
    fontFamily: appFontFamily,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.green,
      secondary: AppColors.red,
      surface: AppColors.surface,
    ),
  );
  return base.copyWith(textTheme: _applyFontStyle(base.textTheme));
}

TextTheme _applyFontStyle(TextTheme t) {
  TextStyle? s(TextStyle? style) => style?.copyWith(fontStyle: appFontStyle);
  return t.copyWith(
    displayLarge: s(t.displayLarge),
    displayMedium: s(t.displayMedium),
    displaySmall: s(t.displaySmall),
    headlineLarge: s(t.headlineLarge),
    headlineMedium: s(t.headlineMedium),
    headlineSmall: s(t.headlineSmall),
    titleLarge: s(t.titleLarge),
    titleMedium: s(t.titleMedium),
    titleSmall: s(t.titleSmall),
    bodyLarge: s(t.bodyLarge),
    bodyMedium: s(t.bodyMedium),
    bodySmall: s(t.bodySmall),
    labelLarge: s(t.labelLarge),
    labelMedium: s(t.labelMedium),
    labelSmall: s(t.labelSmall),
  );
}
