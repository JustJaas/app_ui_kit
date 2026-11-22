import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTheme', () {
    test('el tema claro tiene brillo claro y usa los tokens', () {
      final ThemeData theme = AppTheme.light();

      expect(theme.colorScheme.brightness, Brightness.light);
      expect(theme.colorScheme.primary, AppPalette.green600);
    });

    test('el tema oscuro tiene brillo oscuro', () {
      expect(AppTheme.dark().colorScheme.brightness, Brightness.dark);
    });

    test('ambos temas incluyen los colores semánticos', () {
      expect(AppTheme.light().extension<AppSemanticColors>(), isNotNull);
      expect(AppTheme.dark().extension<AppSemanticColors>(), isNotNull);
    });

    test('copyWith cambia solo el campo indicado', () {
      final AppSemanticColors changed = AppSemanticColors.light.copyWith(
        success: AppPalette.black,
      );

      expect(changed.success, AppPalette.black);
      expect(changed.warning, AppSemanticColors.light.warning);
    });
  });
}
