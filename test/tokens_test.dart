import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Tokens', () {
    test('la escala de espaciado es creciente', () {
      expect(AppSpacing.xs, lessThan(AppSpacing.sm));
      expect(AppSpacing.sm, lessThan(AppSpacing.md));
      expect(AppSpacing.md, lessThan(AppSpacing.lg));
      expect(AppSpacing.lg, lessThan(AppSpacing.xl));
      expect(AppSpacing.xl, lessThan(AppSpacing.xxl));
    });

    test('la escala de radios es creciente', () {
      expect(AppRadius.sm, lessThan(AppRadius.md));
      expect(AppRadius.md, lessThan(AppRadius.lg));
      expect(AppRadius.lg, lessThan(AppRadius.pill));
    });

    test('la escala tipográfica baja de títulos a textos pequeños', () {
      final double headline = AppTypography.textTheme.headlineLarge!.fontSize!;
      final double body = AppTypography.textTheme.bodyMedium!.fontSize!;
      final double small = AppTypography.textTheme.bodySmall!.fontSize!;

      expect(headline, greaterThan(body));
      expect(body, greaterThan(small));
    });
  });
}
