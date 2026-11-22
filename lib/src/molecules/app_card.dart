import 'package:app_ui_kit/src/molecules/app_card_variant.dart';
import 'package:app_ui_kit/src/tokens/app_radius.dart';
import 'package:app_ui_kit/src/tokens/app_spacing.dart';
import 'package:flutter/material.dart';

/// Tarjeta del sistema de diseño. Agrupa contenido relacionado y puede ser
/// pulsable.
class AppCard extends StatelessWidget {
  /// Crea una tarjeta con el [child] indicado.
  const AppCard({
    super.key,
    required this.child,
    this.variant = AppCardVariant.elevated,
    this.onTap,
    this.padding = const EdgeInsets.all(AppSpacing.md),
  });

  /// Contenido de la tarjeta.
  final Widget child;

  /// Variante visual.
  final AppCardVariant variant;

  /// Si no es `null`, la tarjeta es pulsable.
  final VoidCallback? onTap;

  /// Espacio entre el borde de la tarjeta y su contenido.
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Widget content = Padding(padding: padding, child: child);
    final VoidCallback? tapCallback = onTap;

    return Card(
      elevation: variant == AppCardVariant.elevated ? 1 : 0,
      color: variant == AppCardVariant.filled
          ? colorScheme.surfaceContainerHighest
          : colorScheme.surface,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        side: variant == AppCardVariant.outlined
            ? BorderSide(color: colorScheme.outlineVariant)
            : BorderSide.none,
      ),
      child: tapCallback == null
          ? content
          : InkWell(onTap: tapCallback, child: content),
    );
  }
}
