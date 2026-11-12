import 'package:app_ui_kit/src/organisms/app_empty_state.dart';
import 'package:flutter/material.dart';

/// Mensaje de error con un botón para reintentar. Reutiliza `AppEmptyState`
/// con un ícono y un color de error.
class AppErrorState extends StatelessWidget {
  /// Crea un estado de error con el [message] indicado.
  const AppErrorState({
    super.key,
    required this.message,
    this.onRetry,
    this.title = 'Algo salió mal',
    this.retryLabel = 'Reintentar',
  });

  /// Descripción del error.
  final String message;

  /// Acción de reintentar. Si es `null`, no se muestra el botón.
  final VoidCallback? onRetry;

  /// Título del estado de error.
  final String title;

  /// Texto del botón de reintentar.
  final String retryLabel;

  @override
  Widget build(BuildContext context) {
    return AppEmptyState(
      title: title,
      message: message,
      icon: Icons.cloud_off_outlined,
      iconColor: Theme.of(context).colorScheme.error,
      actionLabel: onRetry == null ? null : retryLabel,
      onAction: onRetry,
    );
  }
}
