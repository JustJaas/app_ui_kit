import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/test_app.dart';

void main() {
  group('AppButton', () {
    testWidgets('muestra la etiqueta', (WidgetTester tester) async {
      await tester.pumpWidget(
        TestApp.wrap(AppButton(label: 'Guardar', onPressed: () {})),
      );

      expect(find.text('Guardar'), findsOneWidget);
    });

    testWidgets('ejecuta onPressed al tocarlo', (WidgetTester tester) async {
      int taps = 0;
      await tester.pumpWidget(
        TestApp.wrap(AppButton(label: 'Guardar', onPressed: () => taps++)),
      );

      await tester.tap(find.byType(AppButton));

      expect(taps, 1);
    });

    testWidgets('no responde a toques mientras carga y muestra el loader',
        (WidgetTester tester) async {
      int taps = 0;
      await tester.pumpWidget(
        TestApp.wrap(
          AppButton(label: 'Guardar', onPressed: () => taps++, isLoading: true),
        ),
      );

      await tester.tap(find.byType(AppButton));

      expect(taps, 0);
      expect(find.byType(AppLoader), findsOneWidget);
    });

    testWidgets('queda deshabilitado cuando onPressed es null',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestApp.wrap(const AppButton(label: 'Guardar', onPressed: null)),
      );

      final FilledButton button =
          tester.widget<FilledButton>(find.byType(FilledButton));

      expect(button.onPressed, isNull);
    });

    testWidgets('usa el botón de Material que corresponde a cada variante',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestApp.wrap(
          AppButton(
            label: 'Cancelar',
            onPressed: () {},
            variant: AppButtonVariant.outlined,
          ),
        ),
      );
      expect(find.byType(OutlinedButton), findsOneWidget);

      await tester.pumpWidget(
        TestApp.wrap(
          AppButton(
            label: 'Ver más',
            onPressed: () {},
            variant: AppButtonVariant.text,
          ),
        ),
      );
      expect(find.byType(TextButton), findsOneWidget);
    });
  });
}
