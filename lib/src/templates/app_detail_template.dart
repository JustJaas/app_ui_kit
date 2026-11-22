import 'package:app_ui_kit/src/tokens/app_spacing.dart';
import 'package:flutter/material.dart';

/// Plantilla para pantallas de detalle (perfil, ficha de un elemento).
///
/// **Estructura, de arriba abajo:** barra superior, banner opcional, cabecera
/// (identidad del elemento), secciones y una acción fija al pie de la pantalla.
class AppDetailTemplate extends StatelessWidget {
  /// Crea la plantilla con el [title], la [header] y las [sections] indicados.
  const AppDetailTemplate({
    super.key,
    required this.title,
    required this.header,
    required this.sections,
    this.banner,
    this.actions,
    this.bottomAction,
  });

  /// Título de la barra superior.
  final String title;

  /// Cabecera con la identidad del elemento (por ejemplo, avatar y nombre).
  final Widget header;

  /// Secciones del detalle (por ejemplo, varios `AppSection`).
  final List<Widget> sections;

  /// Mensaje opcional sobre la cabecera (por ejemplo, un aviso).
  final Widget? banner;

  /// Acciones al final de la barra superior.
  final List<Widget>? actions;

  /// Acción fija al pie de la pantalla (por ejemplo, "Editar").
  final Widget? bottomAction;

  @override
  Widget build(BuildContext context) {
    final Widget? bannerWidget = banner;
    final Widget? bottomWidget = bottomAction;

    return Scaffold(
      appBar: AppBar(title: Text(title), actions: actions),
      body: ListView(
        padding: AppSpacing.screenPadding,
        children: <Widget>[
          if (bannerWidget != null) ...<Widget>[
            bannerWidget,
            const SizedBox(height: AppSpacing.md),
          ],
          header,
          for (final Widget section in sections) ...<Widget>[
            const SizedBox(height: AppSpacing.lg),
            section,
          ],
        ],
      ),
      bottomNavigationBar: bottomWidget == null
          ? null
          : SafeArea(
              child: Padding(
                padding: AppSpacing.screenPadding,
                child: bottomWidget,
              ),
            ),
    );
  }
}
