import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:app_ui_kit_showcase/widgets/variant_block.dart';
import 'package:flutter/material.dart';

class StatesPage extends StatelessWidget {
  const StatesPage({super.key});

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppSpacing.screenPadding,
      children: <Widget>[
        const VariantBlock(
          title: 'Vacío',
          child: AppCard(
            variant: AppCardVariant.outlined,
            child: SizedBox(
              height: 240,
              child: AppEmptyState(
                title: 'Aún no tienes tareas',
                message: 'Cuando crees una tarea aparecerá aquí.',
              ),
            ),
          ),
        ),
        VariantBlock(
          title: 'Vacío con acción',
          child: AppCard(
            variant: AppCardVariant.outlined,
            child: SizedBox(
              height: 280,
              child: AppEmptyState(
                title: 'Sin resultados',
                message: 'No encontramos nada con esa búsqueda.',
                icon: Icons.search_off,
                actionLabel: 'Limpiar búsqueda',
                onAction: () => _showMessage(context, 'Búsqueda limpiada'),
              ),
            ),
          ),
        ),
        VariantBlock(
          title: 'Error con reintento',
          child: AppCard(
            variant: AppCardVariant.outlined,
            child: SizedBox(
              height: 300,
              child: AppErrorState(
                message: 'Sin conexión a internet.',
                onRetry: () => _showMessage(context, 'Reintentando...'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
