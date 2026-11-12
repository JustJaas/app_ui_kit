import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:app_ui_kit_showcase/widgets/variant_block.dart';
import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  Widget _content(BuildContext context, String title) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: textTheme.titleSmall),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Las tarjetas agrupan contenido relacionado.',
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppSpacing.screenPadding,
      children: <Widget>[
        VariantBlock(
          title: 'Elevada',
          child: AppCard(child: _content(context, 'Card elevada')),
        ),
        VariantBlock(
          title: 'Con borde',
          child: AppCard(
            variant: AppCardVariant.outlined,
            child: _content(context, 'Card con borde'),
          ),
        ),
        VariantBlock(
          title: 'Rellena',
          child: AppCard(
            variant: AppCardVariant.filled,
            child: _content(context, 'Card rellena'),
          ),
        ),
        VariantBlock(
          title: 'Pulsable',
          description: 'Con onTap, la tarjeta responde al toque',
          child: AppCard(
            variant: AppCardVariant.outlined,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tocaste la tarjeta')),
              );
            },
            child: _content(context, 'Toca esta tarjeta'),
          ),
        ),
      ],
    );
  }
}
