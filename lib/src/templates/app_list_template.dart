import 'package:app_ui_kit/src/tokens/app_spacing.dart';
import 'package:flutter/material.dart';

/// Plantilla para pantallas que muestran una lista o cuadrícula.
///
/// **Estructura:** barra superior, una zona opcional de encabezado (búsqueda o
/// filtros), el cuerpo y un botón flotante opcional.
///
/// La plantilla solo define el **diseño**; el contenido de cada zona lo decide
/// la página. El [body] puede ser la lista, un `AppLoader` mientras carga, un
/// `AppEmptyState` si no hay datos o un `AppErrorState` si algo falla.
class AppListTemplate extends StatelessWidget {
  /// Crea la plantilla con el [title] y el [body] indicados.
  const AppListTemplate({
    super.key,
    required this.title,
    required this.body,
    this.header,
    this.actions,
    this.floatingActionButton,
  });

  /// Título de la barra superior.
  final String title;

  /// Contenido principal de la pantalla.
  final Widget body;

  /// Zona bajo la barra superior (por ejemplo, un `AppSearchField`).
  final Widget? header;

  /// Acciones al final de la barra superior.
  final List<Widget>? actions;

  /// Botón flotante de la pantalla.
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    final Widget? headerWidget = header;

    return Scaffold(
      appBar: AppBar(title: Text(title), actions: actions),
      floatingActionButton: floatingActionButton,
      body: Column(
        children: <Widget>[
          if (headerWidget != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.sm,
                AppSpacing.md,
                AppSpacing.md,
              ),
              child: headerWidget,
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}
