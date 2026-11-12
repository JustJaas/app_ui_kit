import 'package:app_ui_kit/src/common/app_status_type.dart';
import 'package:app_ui_kit/src/theme/app_status_colors.dart';
import 'package:app_ui_kit/src/tokens/app_radius.dart';
import 'package:app_ui_kit/src/tokens/app_spacing.dart';
import 'package:flutter/material.dart';

/// Etiqueta pequeña que indica un estado (por ejemplo, "Activo" o "Pendiente").
class AppBadge extends StatelessWidget {
  /// Crea una etiqueta de estado.
  const AppBadge({
    super.key,
    required this.label,
    this.type = AppStatusType.info,
  });

  /// Texto de la etiqueta.
  final String label;

  /// Tipo de estado; define los colores.
  final AppStatusType type;

  @override
  Widget build(BuildContext context) {
    final AppStatusColors colors = AppStatusColors.of(context, type);
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(
        label,
        style: textTheme.labelSmall?.copyWith(color: colors.foreground),
      ),
    );
  }
}
