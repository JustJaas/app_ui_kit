import 'package:app_ui_kit/src/common/app_status_type.dart';
import 'package:app_ui_kit/src/theme/app_semantic_colors.dart';
import 'package:flutter/material.dart';

/// Colores resueltos para un [AppStatusType] según el tema actual.
///
/// Evita que cada componente repita la decisión "qué color corresponde a un
/// error, a un éxito...".
class AppStatusColors {
  /// Crea un conjunto de colores con su fondo, texto y acento.
  const AppStatusColors({
    required this.background,
    required this.foreground,
    required this.accent,
  });

  /// Resuelve los colores de [type] a partir del tema de [context].
  factory AppStatusColors.of(BuildContext context, AppStatusType type) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final AppSemanticColors semantic = AppSemanticColors.of(context);

    return switch (type) {
      AppStatusType.info => AppStatusColors(
          background: semantic.infoContainer,
          foreground: semantic.onInfoContainer,
          accent: semantic.info,
        ),
      AppStatusType.success => AppStatusColors(
          background: semantic.successContainer,
          foreground: semantic.onSuccessContainer,
          accent: semantic.success,
        ),
      AppStatusType.warning => AppStatusColors(
          background: semantic.warningContainer,
          foreground: semantic.onWarningContainer,
          accent: semantic.warning,
        ),
      AppStatusType.error => AppStatusColors(
          background: scheme.errorContainer,
          foreground: scheme.onErrorContainer,
          accent: scheme.error,
        ),
    };
  }

  /// Color de fondo.
  final Color background;

  /// Color del texto sobre el fondo.
  final Color foreground;

  /// Color de acento (íconos y detalles).
  final Color accent;
}
