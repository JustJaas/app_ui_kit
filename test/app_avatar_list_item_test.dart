import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/test_app.dart';

void main() {
  group('AppAvatar', () {
    testWidgets('muestra las iniciales de las dos primeras palabras',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestApp.wrap(const AppAvatar(label: 'Rick Sanchez')),
      );

      expect(find.text('RS'), findsOneWidget);
    });

    testWidgets('con una sola palabra muestra una inicial',
        (WidgetTester tester) async {
      await tester.pumpWidget(TestApp.wrap(const AppAvatar(label: 'morty')));

      expect(find.text('M'), findsOneWidget);
    });

    testWidgets('sin nombre muestra el ícono', (WidgetTester tester) async {
      await tester.pumpWidget(TestApp.wrap(const AppAvatar()));

      expect(find.byIcon(Icons.person_outline), findsOneWidget);
    });
  });

  group('AppListItem', () {
    testWidgets('muestra título, subtítulo y elementos laterales',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestApp.wrap(
          const AppListItem(
            title: 'Pedido #1042',
            subtitle: '3 productos',
            leading: Icon(Icons.receipt_long_outlined),
            trailing: AppBadge(label: 'Entregado'),
          ),
        ),
      );

      expect(find.text('Pedido #1042'), findsOneWidget);
      expect(find.text('3 productos'), findsOneWidget);
      expect(find.byIcon(Icons.receipt_long_outlined), findsOneWidget);
      expect(find.text('Entregado'), findsOneWidget);
    });

    testWidgets('ejecuta onTap al tocarlo', (WidgetTester tester) async {
      int taps = 0;
      await tester.pumpWidget(
        TestApp.wrap(AppListItem(title: 'Tocar', onTap: () => taps++)),
      );

      await tester.tap(find.text('Tocar'));

      expect(taps, 1);
    });

    testWidgets('soporta textos muy largos sin desbordarse',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestApp.wrap(
          const SizedBox(
            width: 280,
            child: AppListItem(
              title:
                  'Pedido con un nombre de producto extremadamente largo que ocupa varias líneas y debe cortarse con puntos suspensivos',
              subtitle:
                  'Una descripción también muy larga que no debería romper el diseño de la fila en ningún caso',
              trailing: AppBadge(label: 'Entregado'),
            ),
          ),
        ),
      );

      expect(tester.takeException(), isNull);
    });
  });

  group('AppSection', () {
    testWidgets('muestra el título, el contenido y la acción',
        (WidgetTester tester) async {
      int actions = 0;
      await tester.pumpWidget(
        TestApp.wrap(
          AppSection(
            title: 'Actividad',
            actionLabel: 'Ver todo',
            onAction: () => actions++,
            child: const Text('Contenido'),
          ),
        ),
      );

      expect(find.text('Actividad'), findsOneWidget);
      expect(find.text('Contenido'), findsOneWidget);

      await tester.tap(find.text('Ver todo'));

      expect(actions, 1);
    });
  });
}
