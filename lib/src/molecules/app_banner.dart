import 'package:app_ui_kit/src/common/app_status_type.dart';
import 'package:app_ui_kit/src/theme/app_status_colors.dart';
import 'package:app_ui_kit/src/tokens/app_radius.dart';
import 'package:app_ui_kit/src/tokens/app_sizes.dart';
import 'package:app_ui_kit/src/tokens/app_spacing.dart';
import 'package:flutter/material.dart';

/// Mensaje destacado dentro de una pantalla (información, éxito, advertencia
/// o error), con una acción y un botón de cerrar opcionales.
class AppBanner extends StatelessWidget {
  /// Crea un banner con el [message] indicado.
  const AppBanner({
    super.key,
    required this.message,
    this.title,
    this.type = AppStatusType.info,
    this.actionLabel,
    this.onAction,
    this.onClose,
  });

  /// Mensaje principal.
  final String message;

  /// Título opcional, sobre el mensaje.
  final String? title;

  /// Tipo de mensaje; define los colores y el ícono.
  final AppStatusType type;

  /// Texto del botón de acción (solo se muestra si hay [onAction]).
  final String? actionLabel;

  /// Acción del banner.
  final VoidCallback? onAction;

  /// Si no es `null`, se muestra un botón para cerrar el banner.
  final VoidCallback? onClose;

  IconData get _icon {
    return switch (type) {
      AppStatusType.info => Icons.info_outline,
      AppStatusType.success => Icons.check_circle_outline,
      AppStatusType.warning => Icons.warning_amber_outlined,
      AppStatusType.error => Icons.error_outline,
    };
  }

  @override
  Widget build(BuildContext context) {
    final AppStatusColors colors = AppStatusColors.of(context, type);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final String? titleText = title;
    final String? actionText = actionLabel;
    final VoidCallback? actionCallback = onAction;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(_icon, color: colors.accent, size: AppSizes.iconMd),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (titleText != null)
                  Text(
                    titleText,
                    style: textTheme.titleSmall?.copyWith(
                      color: colors.foreground,
                    ),
                  ),
                Text(
                  message,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colors.foreground,
                  ),
                ),
                if (actionText != null && actionCallback != null)
                  TextButton(
                    onPressed: actionCallback,
                    style: TextButton.styleFrom(
                      foregroundColor: colors.foreground,
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(actionText),
                  ),
              ],
            ),
          ),
          if (onClose != null)
            IconButton(
              tooltip: 'Cerrar',
              icon: Icon(Icons.close, color: colors.foreground),
              onPressed: onClose,
            ),
        ],
      ),
    );
  }
}
