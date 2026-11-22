import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/test_app.dart';

void main() {
  group('AppListTemplate', () {
    testWidgets('coloca el título, el encabezado y el cuerpo',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestApp.wrapPage(
          const AppListTemplate(
            title: 'Pedidos',
            header: Text('Encabezado'),
            body: Text('Cuerpo'),
          ),
        ),
      );

      expect(find.text('Pedidos'), findsOneWidget);
      expect(find.text('Encabezado'), findsOneWidget);
      expect(find.text('Cuerpo'), findsOneWidget);
    });

    testWidgets('el encabezado y el botón flotante son opcionales',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestApp.wrapPage(
          const AppListTemplate(title: 'Pedidos', body: Text('Cuerpo')),
        ),
      );

      expect(find.byType(FloatingActionButton), findsNothing);
      expect(find.text('Cuerpo'), findsOneWidget);
    });
  });

  group('AppFormTemplate', () {
    testWidgets('coloca título, descripción, campos y acciones',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestApp.wrapPage(
          const AppFormTemplate(
            title: 'Bienvenido',
            description: 'Inicia sesión',
            fields: <Widget>[Text('Campo 1'), Text('Campo 2')],
            primaryAction: Text('Acción principal'),
            secondaryAction: Text('Acción secundaria'),
          ),
        ),
      );

      expect(find.text('Bienvenido'), findsOneWidget);
      expect(find.text('Inicia sesión'), findsOneWidget);
      expect(find.text('Campo 1'), findsOneWidget);
      expect(find.text('Campo 2'), findsOneWidget);
      expect(find.text('Acción principal'), findsOneWidget);
      expect(find.text('Acción secundaria'), findsOneWidget);
    });

    testWidgets('muestra el banner solo cuando se pasa',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestApp.wrapPage(
          const AppFormTemplate(
            title: 'Formulario',
            fields: <Widget>[],
            primaryAction: Text('Enviar'),
            banner: AppBanner(
              message: 'No se pudo enviar',
              type: AppStatusType.error,
            ),
          ),
        ),
      );

      expect(find.text('No se pudo enviar'), findsOneWidget);
    });

    testWidgets('sin appBarTitle ni acciones no muestra barra superior',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestApp.wrapPage(
          const AppFormTemplate(
            title: 'Formulario',
            fields: <Widget>[],
            primaryAction: Text('Enviar'),
          ),
        ),
      );

      expect(find.byType(AppBar), findsNothing);
    });
  });

  group('AppDetailTemplate', () {
    testWidgets('coloca cabecera, secciones y acción inferior',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestApp.wrapPage(
          const AppDetailTemplate(
            title: 'Mi perfil',
            header: Text('Cabecera'),
            sections: <Widget>[Text('Sección 1'), Text('Sección 2')],
            bottomAction: Text('Editar'),
          ),
        ),
      );

      expect(find.text('Mi perfil'), findsOneWidget);
      expect(find.text('Cabecera'), findsOneWidget);
      expect(find.text('Sección 1'), findsOneWidget);
      expect(find.text('Sección 2'), findsOneWidget);
      expect(find.text('Editar'), findsOneWidget);
    });

    testWidgets('muestra el banner antes de la cabecera',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        TestApp.wrapPage(
          const AppDetailTemplate(
            title: 'Mi perfil',
            header: Text('Cabecera'),
            sections: <Widget>[],
            banner: AppBanner(
              message: 'Completa tu perfil',
              type: AppStatusType.warning,
            ),
          ),
        ),
      );

      expect(find.text('Completa tu perfil'), findsOneWidget);
    });
  });
}
