import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:app_ui_kit_showcase/widgets/color_swatch_tile.dart';
import 'package:app_ui_kit_showcase/widgets/variant_block.dart';
import 'package:flutter/material.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final AppSemanticColors semantic = AppSemanticColors.of(context);

    return ListView(
      padding: AppSpacing.screenPadding,
      children: <Widget>[
        VariantBlock(
          title: 'Marca',
          description: 'primary y secondary, con sus contenedores',
          child: Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: <Widget>[
              ColorSwatchTile(
                label: 'primary',
                color: scheme.primary,
                onColor: scheme.onPrimary,
              ),
              ColorSwatchTile(
                label: 'primaryContainer',
                color: scheme.primaryContainer,
                onColor: scheme.onPrimaryContainer,
              ),
              ColorSwatchTile(
                label: 'secondary',
                color: scheme.secondary,
                onColor: scheme.onSecondary,
              ),
              ColorSwatchTile(
                label: 'secondaryContainer',
                color: scheme.secondaryContainer,
                onColor: scheme.onSecondaryContainer,
              ),
            ],
          ),
        ),
        VariantBlock(
          title: 'Superficies y bordes',
          description: 'Fondos de pantalla, tarjetas y separadores',
          child: Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: <Widget>[
              ColorSwatchTile(
                label: 'surface',
                color: scheme.surface,
                onColor: scheme.onSurface,
              ),
              ColorSwatchTile(
                label: 'surfaceContainerLow',
                color: scheme.surfaceContainerLow,
                onColor: scheme.onSurface,
              ),
              ColorSwatchTile(
                label: 'surfaceContainerHighest',
                color: scheme.surfaceContainerHighest,
                onColor: scheme.onSurface,
              ),
              ColorSwatchTile(
                label: 'outline',
                color: scheme.outline,
                onColor: scheme.surface,
              ),
              ColorSwatchTile(
                label: 'outlineVariant',
                color: scheme.outlineVariant,
                onColor: scheme.onSurface,
              ),
            ],
          ),
        ),
        VariantBlock(
          title: 'Estados',
          description:
              'error viene del ColorScheme; success, warning e info de AppSemanticColors',
          child: Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: <Widget>[
              ColorSwatchTile(
                label: 'error',
                color: scheme.errorContainer,
                onColor: scheme.onErrorContainer,
              ),
              ColorSwatchTile(
                label: 'success',
                color: semantic.successContainer,
                onColor: semantic.onSuccessContainer,
              ),
              ColorSwatchTile(
                label: 'warning',
                color: semantic.warningContainer,
                onColor: semantic.onWarningContainer,
              ),
              ColorSwatchTile(
                label: 'info',
                color: semantic.infoContainer,
                onColor: semantic.onInfoContainer,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
