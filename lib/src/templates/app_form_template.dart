import 'package:app_ui_kit/src/tokens/app_spacing.dart';
import 'package:flutter/material.dart';

/// Plantilla para pantallas con un formulario (inicio de sesión, registro,
/// edición de datos).
///
/// **Estructura, de arriba abajo:** título, descripción, banner opcional,
/// campos, acción principal y acción secundaria. El contenido se desplaza si no
/// cabe y se limita a un ancho máximo en pantallas grandes.
class AppFormTemplate extends StatelessWidget {
  /// Crea la plantilla con los [fields] y la [primaryAction] indicados.
  const AppFormTemplate({
    super.key,
    required this.title,
    required this.fields,
    required this.primaryAction,
    this.appBarTitle,
    this.description,
    this.banner,
    this.secondaryAction,
    this.actions,
  });

  /// Título del formulario, dentro del cuerpo.
  final String title;

  /// Campos del formulario, que se separan con un espacio estándar.
  final List<Widget> fields;

  /// Acción principal (por ejemplo, un `AppButton` de ancho completo).
  final Widget primaryAction;

  /// Título de la barra superior. Si es `null` y no hay [actions], no se
  /// muestra barra superior.
  final String? appBarTitle;

  /// Texto breve que explica qué se pide.
  final String? description;

  /// Mensaje opcional sobre los campos (por ejemplo, un `AppBanner` de error).
  final Widget? banner;

  /// Acción de menor énfasis, bajo la principal.
  final Widget? secondaryAction;

  /// Acciones al final de la barra superior.
  final List<Widget>? actions;

  static const double _maxWidth = 480;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final String? barTitle = appBarTitle;
    final String? descriptionText = description;
    final Widget? bannerWidget = banner;
    final Widget? secondaryWidget = secondaryAction;

    return Scaffold(
      appBar: (barTitle == null && actions == null)
          ? null
          : AppBar(
              title: barTitle == null ? null : Text(barTitle),
              actions: actions,
            ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _maxWidth),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(title, style: textTheme.headlineSmall),
                  if (descriptionText != null) ...<Widget>[
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      descriptionText,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                  const SizedBox(height: AppSpacing.lg),
                  if (bannerWidget != null) ...<Widget>[
                    bannerWidget,
                    const SizedBox(height: AppSpacing.md),
                  ],
                  for (final Widget field in fields) ...<Widget>[
                    field,
                    const SizedBox(height: AppSpacing.md),
                  ],
                  const SizedBox(height: AppSpacing.sm),
                  primaryAction,
                  if (secondaryWidget != null) ...<Widget>[
                    const SizedBox(height: AppSpacing.sm),
                    secondaryWidget,
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
