import 'package:app_ui_kit/src/atoms/app_text_field.dart';
import 'package:flutter/material.dart';

/// Campo de búsqueda: un `AppTextField` con ícono de lupa y botón para limpiar.
///
/// Maneja internamente su controlador, de modo que la pantalla solo recibe el
/// texto mediante [onChanged] o [onSubmitted].
class AppSearchField extends StatefulWidget {
  /// Crea un campo de búsqueda.
  const AppSearchField({
    super.key,
    this.hint = 'Buscar',
    this.onChanged,
    this.onSubmitted,
  });

  /// Texto de ayuda del campo vacío.
  final String hint;

  /// Se llama cada vez que cambia el texto.
  final ValueChanged<String>? onChanged;

  /// Se llama al enviar el texto con el teclado.
  final ValueChanged<String>? onSubmitted;

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

// El State es privado y vive junto a su widget (convención de Flutter).
class _AppSearchFieldState extends State<AppSearchField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleChanged(String value) {
    widget.onChanged?.call(value);
    setState(() {}); // para mostrar u ocultar el botón de limpiar
  }

  void _clear() {
    _controller.clear();
    _handleChanged('');
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: _controller,
      hint: widget.hint,
      prefixIcon: Icons.search,
      textInputAction: TextInputAction.search,
      onChanged: _handleChanged,
      onSubmitted: widget.onSubmitted,
      suffix: _controller.text.isEmpty
          ? null
          : IconButton(
              tooltip: 'Limpiar',
              icon: const Icon(Icons.close),
              onPressed: _clear,
            ),
    );
  }
}
