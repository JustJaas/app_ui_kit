import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:app_ui_kit_showcase/widgets/variant_block.dart';
import 'package:flutter/material.dart';

class LoadersPage extends StatelessWidget {
  const LoadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppSpacing.screenPadding,
      children: <Widget>[
        const VariantBlock(
          title: 'Tamaños',
          child: Row(
            children: <Widget>[
              AppLoader(size: AppLoaderSize.small),
              SizedBox(width: AppSpacing.lg),
              AppLoader(),
              SizedBox(width: AppSpacing.lg),
              AppLoader(size: AppLoaderSize.large),
            ],
          ),
        ),
        const VariantBlock(
          title: 'Con mensaje',
          child: AppLoader(message: 'Cargando personajes...'),
        ),
        VariantBlock(
          title: 'Dentro de un botón',
          description: 'AppButton usa un loader pequeño cuando isLoading es true',
          child: AppButton(label: 'Guardando', isLoading: true, onPressed: () {}),
        ),
      ],
    );
  }
}
