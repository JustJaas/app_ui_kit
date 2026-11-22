import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class PlaceholderBlock extends StatelessWidget {
  const PlaceholderBlock({super.key, required this.label, this.height = 56});

  final String label;
  final double height;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: height,
      child: AppCard(
        variant: AppCardVariant.filled,
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: textTheme.labelMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}
