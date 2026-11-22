import 'package:app_ui_kit/src/theme/app_semantic_colors.dart';
import 'package:app_ui_kit/src/tokens/app_palette.dart';
import 'package:app_ui_kit/src/tokens/app_radius.dart';
import 'package:app_ui_kit/src/tokens/app_typography.dart';
import 'package:flutter/material.dart';

/// Tema de Material listo para usar en un `MaterialApp`.
///
/// Convierte los tokens ([AppPalette], [AppTypography], [AppRadius]) en un
/// `ThemeData`. Todos los componentes del kit leen su aspecto de aquí.
///
/// ```dart
/// MaterialApp(
///   theme: AppTheme.light(),
///   darkTheme: AppTheme.dark(),
/// );
/// ```
class AppTheme {
  /// Tema claro.
  static ThemeData light() => _build(_lightScheme, AppSemanticColors.light);

  /// Tema oscuro.
  static ThemeData dark() => _build(_darkScheme, AppSemanticColors.dark);

  static const ColorScheme _lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppPalette.green600,
    onPrimary: AppPalette.neutral0,
    primaryContainer: AppPalette.green100,
    onPrimaryContainer: AppPalette.green900,
    secondary: AppPalette.slate600,
    onSecondary: AppPalette.neutral0,
    secondaryContainer: AppPalette.slate100,
    onSecondaryContainer: AppPalette.slate900,
    error: AppPalette.red600,
    onError: AppPalette.neutral0,
    errorContainer: AppPalette.red100,
    onErrorContainer: AppPalette.red900,
    surface: AppPalette.neutral0,
    onSurface: AppPalette.neutral900,
    onSurfaceVariant: AppPalette.neutral700,
    outline: AppPalette.neutral500,
    outlineVariant: AppPalette.neutral300,
    surfaceContainerLowest: AppPalette.neutral0,
    surfaceContainerLow: AppPalette.neutral50,
    surfaceContainer: AppPalette.neutral50,
    surfaceContainerHigh: AppPalette.neutral100,
    surfaceContainerHighest: AppPalette.neutral100,
    inverseSurface: AppPalette.neutral900,
    onInverseSurface: AppPalette.neutral50,
    inversePrimary: AppPalette.green300,
    scrim: AppPalette.black,
  );

  static const ColorScheme _darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppPalette.green300,
    onPrimary: AppPalette.green900,
    primaryContainer: AppPalette.green900,
    onPrimaryContainer: AppPalette.green100,
    secondary: AppPalette.slate300,
    onSecondary: AppPalette.slate900,
    secondaryContainer: AppPalette.slate900,
    onSecondaryContainer: AppPalette.slate100,
    error: AppPalette.red300,
    onError: AppPalette.red900,
    errorContainer: AppPalette.red900,
    onErrorContainer: AppPalette.red100,
    surface: AppPalette.neutral850,
    onSurface: AppPalette.neutral100,
    onSurfaceVariant: AppPalette.neutral300,
    outline: AppPalette.neutral500,
    outlineVariant: AppPalette.neutral700,
    surfaceContainerLowest: AppPalette.neutral950,
    surfaceContainerLow: AppPalette.neutral900,
    surfaceContainer: AppPalette.neutral850,
    surfaceContainerHigh: AppPalette.neutral800,
    surfaceContainerHighest: AppPalette.neutral800,
    inverseSurface: AppPalette.neutral100,
    onInverseSurface: AppPalette.neutral900,
    inversePrimary: AppPalette.green600,
    scrim: AppPalette.black,
  );

  static ThemeData _build(ColorScheme colorScheme, AppSemanticColors semantic) {
    final RoundedRectangleBorder buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: AppTypography.textTheme,
      scaffoldBackgroundColor: colorScheme.surfaceContainerLow,
      extensions: <ThemeExtension<dynamic>>[semantic],
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        scrolledUnderElevation: 0,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(shape: buttonShape),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(shape: buttonShape),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(shape: buttonShape),
      ),
    );
  }
}
