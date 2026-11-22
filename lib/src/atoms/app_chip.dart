import 'package:app_ui_kit/src/tokens/app_radius.dart';
import 'package:app_ui_kit/src/tokens/app_sizes.dart';
import 'package:flutter/material.dart';

/// Chip del sistema de diseño.
///
/// - Sin [onSelected] ni [onDeleted]: etiqueta de solo lectura.
/// - Con [onSelected]: chip que se puede seleccionar (por ejemplo, un filtro).
/// - Con [onDeleted]: muestra un botón para eliminarlo.
class AppChip extends StatelessWidget {
  /// Crea un chip.
  const AppChip({
    super.key,
    required this.label,
    this.selected = false,
    this.onSelected,
    this.onDeleted,
    this.icon,
  });

  /// Texto del chip.
  final String label;

  /// Indica si está seleccionado (solo aplica si hay [onSelected]).
  final bool selected;

  /// Se llama al seleccionar o deseleccionar. Hace que el chip sea interactivo.
  final ValueChanged<bool>? onSelected;

  /// Se llama al pulsar el botón de eliminar. Si es `null`, no se muestra.
  final VoidCallback? onDeleted;

  /// Ícono opcional al inicio del chip.
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final OutlinedBorder shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.pill),
    );
    final Widget? avatar =
        icon == null ? null : Icon(icon, size: AppSizes.iconSm);
    final ValueChanged<bool>? selectCallback = onSelected;

    if (selectCallback == null && onDeleted == null) {
      return Chip(label: Text(label), avatar: avatar, shape: shape);
    }

    if (selectCallback == null) {
      return Chip(
        label: Text(label),
        avatar: avatar,
        onDeleted: onDeleted,
        shape: shape,
      );
    }

    return InputChip(
      label: Text(label),
      avatar: avatar,
      selected: selected,
      onSelected: selectCallback,
      onDeleted: onDeleted,
      shape: shape,
    );
  }
}
