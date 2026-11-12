import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:app_ui_kit_showcase/widgets/variant_block.dart';
import 'package:flutter/material.dart';

class BannersPage extends StatefulWidget {
  const BannersPage({super.key});

  @override
  State<BannersPage> createState() => _BannersPageState();
}

class _BannersPageState extends State<BannersPage> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppSpacing.screenPadding,
      children: <Widget>[
        const VariantBlock(
          title: 'Tipos',
          child: Column(
            children: <Widget>[
              AppBanner(message: 'Tienes una actualización disponible.'),
              SizedBox(height: AppSpacing.sm),
              AppBanner(
                message: 'Los cambios se guardaron correctamente.',
                type: AppStatusType.success,
              ),
              SizedBox(height: AppSpacing.sm),
              AppBanner(
                message: 'Tu sesión está por expirar.',
                type: AppStatusType.warning,
              ),
              SizedBox(height: AppSpacing.sm),
              AppBanner(
                message: 'No pudimos guardar los cambios.',
                type: AppStatusType.error,
              ),
            ],
          ),
        ),
        const VariantBlock(
          title: 'Con título',
          child: AppBanner(
            title: 'Modo sin conexión',
            message:
                'Los datos se sincronizarán cuando vuelvas a tener internet.',
            type: AppStatusType.warning,
          ),
        ),
        VariantBlock(
          title: 'Con acción',
          child: AppBanner(
            message: 'No se pudo cargar la lista.',
            type: AppStatusType.error,
            actionLabel: 'Reintentar',
            onAction: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Reintentando...')),
              );
            },
          ),
        ),
        VariantBlock(
          title: 'Se puede cerrar',
          child: _isVisible
              ? AppBanner(
                  message: 'Toca la X para cerrar este mensaje.',
                  type: AppStatusType.success,
                  onClose: () => setState(() => _isVisible = false),
                )
              : AppButton(
                  label: 'Mostrar de nuevo',
                  variant: AppButtonVariant.outlined,
                  onPressed: () => setState(() => _isVisible = true),
                ),
        ),
      ],
    );
  }
}
