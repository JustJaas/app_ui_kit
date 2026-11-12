import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:app_ui_kit_showcase/widgets/variant_block.dart';
import 'package:flutter/material.dart';

class SpacingPage extends StatelessWidget {
  const SpacingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final List<(String, double)> spacing = <(String, double)>[
      ('xs', AppSpacing.xs),
      ('sm', AppSpacing.sm),
      ('md', AppSpacing.md),
      ('lg', AppSpacing.lg),
      ('xl', AppSpacing.xl),
      ('xxl', AppSpacing.xxl),
    ];
    final List<(String, double)> radii = <(String, double)>[
      ('sm', AppRadius.sm),
      ('md', AppRadius.md),
      ('lg', AppRadius.lg),
      ('pill', AppRadius.pill),
    ];

    return ListView(
      padding: AppSpacing.screenPadding,
      children: <Widget>[
        VariantBlock(
          title: 'Espaciado',
          description: 'Escala basada en 4 px',
          child: Column(
            children: <Widget>[
              for (final (String name, double value) in spacing)
                Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 90,
                        child: Text(
                          '$name · ${value.toStringAsFixed(0)}',
                          style: textTheme.bodySmall,
                        ),
                      ),
                      Container(
                        width: value,
                        height: AppSpacing.md,
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          borderRadius: BorderRadius.circular(AppRadius.sm / 2),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        VariantBlock(
          title: 'Radios de borde',
          description: 'pill produce bordes totalmente redondeados',
          child: Wrap(
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.md,
            children: <Widget>[
              for (final (String name, double value) in radii)
                Column(
                  children: <Widget>[
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(value),
                        border: Border.all(color: colorScheme.primary),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(name, style: textTheme.bodySmall),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
