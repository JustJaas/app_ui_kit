import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:app_ui_kit_showcase/widgets/variant_block.dart';
import 'package:flutter/material.dart';

class BadgesDemo extends StatelessWidget {
  const BadgesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: AppSpacing.screenPadding,
      children: <Widget>[
        const VariantBlock(
          title: 'Tipos',
          child: Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: <Widget>[
              AppBadge(label: 'Información'),
              AppBadge(label: 'Activo', type: AppStatusType.success),
              AppBadge(label: 'Pendiente', type: AppStatusType.warning),
              AppBadge(label: 'Fallido', type: AppStatusType.error),
            ],
          ),
        ),
        VariantBlock(
          title: 'En contexto',
          description: 'Junto a un texto dentro de una fila',
          child: AppCard(
            variant: AppCardVariant.outlined,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('Pedido #1042', style: textTheme.titleSmall),
                ),
                const AppBadge(
                  label: 'Entregado',
                  type: AppStatusType.success,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
