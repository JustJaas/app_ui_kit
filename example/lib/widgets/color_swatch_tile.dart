import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class ColorSwatchTile extends StatelessWidget {
  const ColorSwatchTile({
    super.key,
    required this.label,
    required this.color,
    required this.onColor,
  });

  final String label;
  final Color color;

  final Color onColor;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      width: 150,
      height: 64,
      padding: const EdgeInsets.all(AppSpacing.sm),
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child:
          Text(label, style: textTheme.labelMedium?.copyWith(color: onColor)),
    );
  }
}
