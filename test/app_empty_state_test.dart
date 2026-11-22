import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/test_app.dart';

void main() {
  group('AppEmptyState', () {
    testWidgets('muestra el título y el mensaje', (WidgetTester tester) async {
      await tester.pumpWidget(
        TestApp.wrap(
          const AppEmptyState(
            title: 'Sin tareas',
            message: 'Crea tu primera tarea',
          ),
        ),
      );

      expect(find.text('Sin tareas'), findsOneWidget);
      expect(find.text('Crea tu primera tarea'), findsOneWidget);
    });

    testWidgets('muestra la acción y la ejecuta', (WidgetTester tester) async {
      int actions = 0;
      await tester.pumpWidget(
        TestApp.wrap(
          AppEmptyState(
            title: 'Sin tareas',
            actionLabel: 'Crear tarea',
            onAction: () => actions++,
          ),
        ),
      );

      await tester.tap(find.text('Crear tarea'));

      expect(actions, 1);
    });
  });

  group('AppErrorState', () {
    testWidgets('muestra el mensaje y permite reintentar',
        (WidgetTester tester) async {
      int retries = 0;
      await tester.pumpWidget(
        TestApp.wrap(
          AppErrorState(
            message: 'Sin conexión a internet.',
            onRetry: () => retries++,
          ),
        ),
      );

      expect(find.text('Sin conexión a internet.'), findsOneWidget);

      await tester.tap(find.text('Reintentar'));

      expect(retries, 1);
    });

    testWidgets('no muestra el botón si no hay onRetry',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestApp.wrap(const AppErrorState(message: 'Algo falló')),
      );

      expect(find.text('Reintentar'), findsNothing);
    });
  });
}
