import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:app_ui_kit_showcase/widgets/variant_block.dart';
import 'package:flutter/material.dart';

class ButtonsPage extends StatefulWidget {
  const ButtonsPage({super.key});

  @override
  State<ButtonsPage> createState() => _ButtonsPageState();
}

class _ButtonsPageState extends State<ButtonsPage> {
  bool _isLoading = false;

  Future<void> _simulateLoading() async {
    setState(() => _isLoading = true);
    await Future<void>.delayed(const Duration(seconds: 2));
    if (!mounted) {
      return;
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppSpacing.screenPadding,
      children: <Widget>[
        VariantBlock(
          title: 'Variantes',
          description: 'primary, secondary, outlined, text y danger',
          child: Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: <Widget>[
              AppButton(label: 'Primary', onPressed: () {}),
              AppButton(
                label: 'Secondary',
                onPressed: () {},
                variant: AppButtonVariant.secondary,
              ),
              AppButton(
                label: 'Outlined',
                onPressed: () {},
                variant: AppButtonVariant.outlined,
              ),
              AppButton(
                label: 'Text',
                onPressed: () {},
                variant: AppButtonVariant.text,
              ),
              AppButton(
                label: 'Danger',
                onPressed: () {},
                variant: AppButtonVariant.danger,
              ),
            ],
          ),
        ),
        VariantBlock(
          title: 'Tamaños',
          child: Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              AppButton(
                label: 'Small',
                onPressed: () {},
                size: AppButtonSize.small,
              ),
              AppButton(label: 'Medium', onPressed: () {}),
              AppButton(
                label: 'Large',
                onPressed: () {},
                size: AppButtonSize.large,
              ),
            ],
          ),
        ),
        VariantBlock(
          title: 'Con ícono',
          child: Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: <Widget>[
              AppButton(label: 'Agregar', icon: Icons.add, onPressed: () {}),
              AppButton(
                label: 'Eliminar',
                icon: Icons.delete_outline,
                onPressed: () {},
                variant: AppButtonVariant.danger,
              ),
            ],
          ),
        ),
        const VariantBlock(
          title: 'Deshabilitado',
          description: 'onPressed null',
          child: Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: <Widget>[
              AppButton(label: 'Primary', onPressed: null),
              AppButton(
                label: 'Outlined',
                onPressed: null,
                variant: AppButtonVariant.outlined,
              ),
            ],
          ),
        ),
        VariantBlock(
          title: 'Estado de carga',
          description: 'Pulsa el botón: muestra el loader durante 2 segundos',
          child: AppButton(
            label: _isLoading ? 'Guardando...' : 'Guardar cambios',
            isLoading: _isLoading,
            onPressed: _simulateLoading,
          ),
        ),
        VariantBlock(
          title: 'Ancho completo',
          child: AppButton(
            label: 'Continuar',
            isExpanded: true,
            size: AppButtonSize.large,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
