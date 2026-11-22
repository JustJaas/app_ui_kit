import 'package:app_ui_kit/src/molecules/app_card.dart';
import 'package:app_ui_kit/src/molecules/app_card_variant.dart';
import 'package:app_ui_kit/src/tokens/app_spacing.dart';
import 'package:flutter/material.dart';

/// Fila de una lista: un elemento inicial opcional, título, subtítulo y un
/// elemento final opcional, dentro de una tarjeta con borde.
///
/// Los textos largos se cortan con puntos suspensivos (máximo dos líneas), de
/// modo que la fila nunca se desborda.
class AppListItem extends StatelessWidget {
  /// Crea una fila de lista con el [title] indicado.
  const AppListItem({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
  });

  /// Texto principal.
  final String title;

  /// Texto secundario, debajo del título.
  final String? subtitle;

  /// Elemento al inicio de la fila (por ejemplo, un `AppAvatar` o un ícono).
  final Widget? leading;

  /// Elemento al final de la fila (por ejemplo, un `AppBadge`).
  final Widget? trailing;

  /// Si no es `null`, la fila es pulsable.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final String? subtitleText = subtitle;
    final Widget? leadingWidget = leading;
    final Widget? trailingWidget = trailing;

    return AppCard(
      variant: AppCardVariant.outlined,
      onTap: onTap,
      child: Row(
        children: <Widget>[
          if (leadingWidget != null) ...<Widget>[
            leadingWidget,
            const SizedBox(width: AppSpacing.md),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleSmall,
                ),
                if (subtitleText != null)
                  Text(
                    subtitleText,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
          ),
          if (trailingWidget != null) ...<Widget>[
            const SizedBox(width: AppSpacing.md),
            trailingWidget,
          ],
        ],
      ),
    );
  }
}
