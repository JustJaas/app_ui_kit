import 'package:app_ui_kit/src/atoms/app_button.dart';
import 'package:app_ui_kit/src/atoms/app_button_variant.dart';
import 'package:app_ui_kit/src/tokens/app_sizes.dart';
import 'package:app_ui_kit/src/tokens/app_spacing.dart';
import 'package:flutter/material.dart';

/// Mensaje de "no hay nada que mostrar": ícono, título, mensaje y una acción
/// opcional.
class AppEmptyState extends StatelessWidget {
  /// Crea un estado vacío con el [title] indicado.
  const AppEmptyState({
    super.key,
    required this.title,
    this.message,
    this.icon = Icons.inbox_outlined,
    this.iconColor,
    this.actionLabel,
    this.onAction,
  });

  /// Título principal.
  final String title;

  /// Mensaje explicativo debajo del título.
  final String? message;

  /// Ícono que ilustra el estado.
  final IconData icon;

  /// Color del ícono. Si es `null` usa un tono neutro del tema.
  final Color? iconColor;

  /// Texto del botón de acción (solo se muestra si hay [onAction]).
  final String? actionLabel;

  /// Acción del botón.
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final String? messageText = message;
    final String? actionText = actionLabel;
    final VoidCallback? actionCallback = onAction;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              size: AppSizes.iconXl,
              color: iconColor ?? colorScheme.outline,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              title,
              textAlign: TextAlign.center,
              style: textTheme.titleMedium,
            ),
            if (messageText != null) ...<Widget>[
              const SizedBox(height: AppSpacing.sm),
              Text(
                messageText,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            if (actionText != null && actionCallback != null) ...<Widget>[
              const SizedBox(height: AppSpacing.lg),
              AppButton(
                label: actionText,
                onPressed: actionCallback,
                variant: AppButtonVariant.outlined,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
