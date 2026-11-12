import 'package:app_ui_kit/src/atoms/app_loader_size.dart';
import 'package:app_ui_kit/src/tokens/app_sizes.dart';
import 'package:app_ui_kit/src/tokens/app_spacing.dart';
import 'package:flutter/material.dart';

/// Indicador de carga circular, con un mensaje opcional debajo.
class AppLoader extends StatelessWidget {
  /// Crea un indicador de carga.
  const AppLoader({
    super.key,
    this.size = AppLoaderSize.medium,
    this.color,
    this.message,
  });

  /// Tamaño del indicador.
  final AppLoaderSize size;

  /// Color del indicador. Si es `null` usa el color primario del tema.
  final Color? color;

  /// Mensaje que se muestra debajo del indicador.
  final String? message;

  double get _diameter {
    return switch (size) {
      AppLoaderSize.small => AppSizes.loaderSm,
      AppLoaderSize.medium => AppSizes.loaderMd,
      AppLoaderSize.large => AppSizes.loaderLg,
    };
  }

  double get _strokeWidth {
    return switch (size) {
      AppLoaderSize.small => 2,
      AppLoaderSize.medium => 3,
      AppLoaderSize.large => 4,
    };
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final String? messageText = message;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: _diameter,
          height: _diameter,
          child: CircularProgressIndicator(
            strokeWidth: _strokeWidth,
            color: color,
          ),
        ),
        if (messageText != null) ...<Widget>[
          const SizedBox(height: AppSpacing.md),
          Text(
            messageText,
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }
}
