import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/test_app.dart';

void main() {
  group('AppBanner', () {
    testWidgets('muestra el título y el mensaje', (WidgetTester tester) async {
      await tester.pumpWidget(
        TestApp.wrap(
          const AppBanner(
            title: 'Aviso',
            message: 'Se guardaron los cambios',
            type: AppStatusType.success,
          ),
        ),
      );

      expect(find.text('Aviso'), findsOneWidget);
      expect(find.text('Se guardaron los cambios'), findsOneWidget);
    });

    testWidgets('ejecuta la acción al pulsar el botón',
        (WidgetTester tester) async {
      int actions = 0;
      await tester.pumpWidget(
        TestApp.wrap(
          AppBanner(
            message: 'Sin conexión',
            type: AppStatusType.error,
            actionLabel: 'Reintentar',
            onAction: () => actions++,
          ),
        ),
      );

      await tester.tap(find.text('Reintentar'));

      expect(actions, 1);
    });

    testWidgets('muestra el botón de cerrar solo si hay onClose',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestApp.wrap(const AppBanner(message: 'Hola')),
      );
      expect(find.byIcon(Icons.close), findsNothing);

      await tester.pumpWidget(
        TestApp.wrap(AppBanner(message: 'Hola', onClose: () {})),
      );
      expect(find.byIcon(Icons.close), findsOneWidget);
    });
  });
}
