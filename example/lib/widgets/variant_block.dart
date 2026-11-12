import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class VariantBlock extends StatelessWidget {
  const VariantBlock({
    super.key,
    required this.title,
    required this.child,
    this.description,
  });

  final String title;
  final String? description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final String? descriptionText = description;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: textTheme.titleSmall),
          if (descriptionText != null)
            Text(
              descriptionText,
              style: textTheme.bodySmall?.copyWith(color: colorScheme.outline),
            ),
          const SizedBox(height: AppSpacing.sm),
          child,
        ],
      ),
    );
  }
}
