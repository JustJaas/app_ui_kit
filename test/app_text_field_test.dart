import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/test_app.dart';

void main() {
  group('AppTextField', () {
    testWidgets('muestra la etiqueta y el texto de ayuda',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestApp.wrap(
          const AppTextField(label: 'Correo', helperText: 'Usa tu correo real'),
        ),
      );

      expect(find.text('Correo'), findsOneWidget);
      expect(find.text('Usa tu correo real'), findsOneWidget);
    });

    testWidgets('muestra el mensaje de error', (WidgetTester tester) async {
      await tester.pumpWidget(
        TestApp.wrap(
          const AppTextField(label: 'Correo', errorText: 'Correo no válido'),
        ),
      );

      expect(find.text('Correo no válido'), findsOneWidget);
    });

    testWidgets('el modo contraseña oculta el texto y permite mostrarlo',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestApp.wrap(const AppTextField(label: 'Contraseña', isPassword: true)),
      );

      expect(tester.widget<TextField>(find.byType(TextField)).obscureText, isTrue);

      await tester.tap(find.byIcon(Icons.visibility_outlined));
      await tester.pump();

      expect(tester.widget<TextField>(find.byType(TextField)).obscureText, isFalse);
    });

    testWidgets('avisa cuando cambia el texto', (WidgetTester tester) async {
      String received = '';
      await tester.pumpWidget(
        TestApp.wrap(
          AppTextField(
            label: 'Nombre',
            onChanged: (String value) => received = value,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'Rick');

      expect(received, 'Rick');
    });
  });
}
