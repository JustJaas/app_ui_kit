import 'package:app_ui_kit/src/atoms/app_button_size.dart';
import 'package:app_ui_kit/src/atoms/app_button_variant.dart';
import 'package:app_ui_kit/src/atoms/app_loader.dart';
import 'package:app_ui_kit/src/atoms/app_loader_size.dart';
import 'package:app_ui_kit/src/tokens/app_sizes.dart';
import 'package:app_ui_kit/src/tokens/app_spacing.dart';
import 'package:flutter/material.dart';

/// Botón del sistema de diseño, con variantes, tamaños y estado de carga.
///
/// ```dart
/// AppButton(
///   label: 'Guardar',
///   onPressed: () {},
///   variant: AppButtonVariant.primary,
///   isLoading: false,
/// )
/// ```
class AppButton extends StatelessWidget {
  /// Crea un botón. Si [onPressed] es `null`, el botón queda deshabilitado.
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.medium,
    this.icon,
    this.isLoading = false,
    this.isExpanded = false,
  });

  /// Texto del botón.
  final String label;

  /// Acción al pulsar. `null` deshabilita el botón.
  final VoidCallback? onPressed;

  /// Variante visual.
  final AppButtonVariant variant;

  /// Tamaño del botón.
  final AppButtonSize size;

  /// Ícono opcional que se muestra antes del texto.
  final IconData? icon;

  /// Si es `true`, muestra un loader y no responde a toques.
  final bool isLoading;

  /// Si es `true`, el botón ocupa todo el ancho disponible.
  final bool isExpanded;

  double get _height {
    return switch (size) {
      AppButtonSize.small => AppSizes.buttonHeightSm,
      AppButtonSize.medium => AppSizes.buttonHeightMd,
      AppButtonSize.large => AppSizes.buttonHeightLg,
    };
  }

  double get _horizontalPadding {
    return switch (size) {
      AppButtonSize.small => AppSpacing.md,
      AppButtonSize.medium => AppSpacing.lg,
      AppButtonSize.large => AppSpacing.lg,
    };
  }

  // Color del contenido según la variante (se usa para el loader).
  Color _foregroundColor(ColorScheme colorScheme) {
    return switch (variant) {
      AppButtonVariant.primary => colorScheme.onPrimary,
      AppButtonVariant.secondary => colorScheme.onSecondaryContainer,
      AppButtonVariant.danger => colorScheme.onError,
      AppButtonVariant.outlined || AppButtonVariant.text => colorScheme.primary,
    };
  }

  ButtonStyle _buildStyle(ColorScheme colorScheme) {
    final ButtonStyle base = ButtonStyle(
      minimumSize: WidgetStatePropertyAll<Size>(Size(0, _height)),
      padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(horizontal: _horizontalPadding),
      ),
    );

    if (variant == AppButtonVariant.danger) {
      return base.merge(
        FilledButton.styleFrom(
          backgroundColor: colorScheme.error,
          foregroundColor: colorScheme.onError,
        ),
      );
    }
    return base;
  }

  Widget _buildContent(ColorScheme colorScheme) {
    final Widget? leading = isLoading
        ? AppLoader(
            size: AppLoaderSize.small,
            color: _foregroundColor(colorScheme),
          )
        : (icon == null ? null : Icon(icon, size: AppSizes.iconSm));

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (leading != null) ...<Widget>[
          leading,
          const SizedBox(width: AppSpacing.sm),
        ],
        Flexible(
          child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }

  void _doNothing() {}

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final ButtonStyle style = _buildStyle(colorScheme);
    final Widget content = _buildContent(colorScheme);

    // Mientras carga, el botón sigue "habilitado" visualmente (para que el
    // loader se vea bien) pero ignora los toques.
    final VoidCallback? handler =
        onPressed == null ? null : (isLoading ? _doNothing : onPressed);

    final Widget button = switch (variant) {
      AppButtonVariant.primary || AppButtonVariant.danger => FilledButton(
          onPressed: handler,
          style: style,
          child: content,
        ),
      AppButtonVariant.secondary => FilledButton.tonal(
          onPressed: handler,
          style: style,
          child: content,
        ),
      AppButtonVariant.outlined => OutlinedButton(
          onPressed: handler,
          style: style,
          child: content,
        ),
      AppButtonVariant.text => TextButton(
          onPressed: handler,
          style: style,
          child: content,
        ),
    };

    return isExpanded
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }
}
