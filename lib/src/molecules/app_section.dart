import 'package:app_ui_kit/src/tokens/app_spacing.dart';
import 'package:flutter/material.dart';

/// Bloque de una pantalla: un título (con una acción opcional a la derecha)
/// seguido de su contenido.
class AppSection extends StatelessWidget {
  /// Crea una sección con el [title] y el [child] indicados.
  const AppSection({
    super.key,
    required this.title,
    required this.child,
    this.actionLabel,
    this.onAction,
  });

  /// Título de la sección.
  final String title;

  /// Contenido de la sección.
  final Widget child;

  /// Texto de la acción (solo se muestra si hay [onAction]).
  final String? actionLabel;

  /// Acción de la sección (por ejemplo, "Ver todo").
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final String? actionText = actionLabel;
    final VoidCallback? actionCallback = onAction;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(child: Text(title, style: textTheme.titleMedium)),
            if (actionText != null && actionCallback != null)
              TextButton(onPressed: actionCallback, child: Text(actionText)),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        child,
      ],
    );
  }
}
