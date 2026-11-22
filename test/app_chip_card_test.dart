import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/test_app.dart';

void main() {
  group('AppChip', () {
    testWidgets('sin callbacks es una etiqueta de solo lectura',
        (WidgetTester tester) async {
      await tester.pumpWidget(TestApp.wrap(const AppChip(label: 'Flutter')));

      expect(find.byType(Chip), findsOneWidget);
      expect(find.byType(InputChip), findsNothing);
    });

    testWidgets('con onSelected avisa al tocarlo', (WidgetTester tester) async {
      bool? received;
      await tester.pumpWidget(
        TestApp.wrap(
          AppChip(
            label: 'Dart',
            selected: false,
            onSelected: (bool value) => received = value,
          ),
        ),
      );

      await tester.tap(find.text('Dart'));

      expect(received, isTrue);
    });
  });

  group('AppCard', () {
    testWidgets('muestra su contenido', (WidgetTester tester) async {
      await tester.pumpWidget(
        TestApp.wrap(const AppCard(child: Text('Contenido'))),
      );

      expect(find.text('Contenido'), findsOneWidget);
    });

    testWidgets('es pulsable solo si recibe onTap', (WidgetTester tester) async {
      int taps = 0;
      await tester.pumpWidget(
        TestApp.wrap(
          AppCard(onTap: () => taps++, child: const Text('Tocar')),
        ),
      );

      await tester.tap(find.text('Tocar'));

      expect(taps, 1);
    });
  });
}
