import 'package:app_ui_kit/src/tokens/app_radius.dart';
import 'package:flutter/material.dart';

/// Campo de texto del sistema de diseño.
///
/// Con `isPassword: true` oculta el texto y agrega un botón para mostrarlo.
///
/// ```dart
/// AppTextField(
///   label: 'Correo',
///   hint: 'nombre@ejemplo.com',
///   errorText: null,
///   onChanged: (String value) {},
/// )
/// ```
class AppTextField extends StatefulWidget {
  /// Crea un campo de texto.
  const AppTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffix,
    this.keyboardType,
    this.textInputAction,
    this.isPassword = false,
    this.enabled = true,
    this.maxLines = 1,
    this.onChanged,
    this.onSubmitted,
  });

  /// Controlador del texto.
  final TextEditingController? controller;

  /// Etiqueta que se muestra sobre el campo.
  final String? label;

  /// Texto de ayuda dentro del campo vacío.
  final String? hint;

  /// Texto de ayuda debajo del campo.
  final String? helperText;

  /// Mensaje de error. Si no es `null`, el campo se muestra en estado de error.
  final String? errorText;

  /// Ícono al inicio del campo.
  final IconData? prefixIcon;

  /// Widget al final del campo (se ignora si [isPassword] es `true`).
  final Widget? suffix;

  /// Tipo de teclado.
  final TextInputType? keyboardType;

  /// Acción del botón de enviar del teclado.
  final TextInputAction? textInputAction;

  /// Si es `true`, oculta el texto y muestra el botón de mostrar contraseña.
  final bool isPassword;

  /// Si es `false`, el campo no se puede editar.
  final bool enabled;

  /// Número máximo de líneas (se ignora en contraseñas).
  final int maxLines;

  /// Se llama cada vez que cambia el texto.
  final ValueChanged<String>? onChanged;

  /// Se llama al enviar el texto con el teclado.
  final ValueChanged<String>? onSubmitted;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

// El State es privado y vive junto a su widget (convención de Flutter).
class _AppTextFieldState extends State<AppTextField> {
  bool _obscured = true;

  OutlineInputBorder _border(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  Widget? _buildSuffix() {
    if (widget.isPassword) {
      return IconButton(
        tooltip: _obscured ? 'Mostrar contraseña' : 'Ocultar contraseña',
        icon: Icon(
          _obscured ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        ),
        onPressed: () => setState(() => _obscured = !_obscured),
      );
    }
    return widget.suffix;
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return TextField(
      controller: widget.controller,
      enabled: widget.enabled,
      obscureText: widget.isPassword && _obscured,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        helperText: widget.helperText,
        errorText: widget.errorText,
        prefixIcon: widget.prefixIcon == null ? null : Icon(widget.prefixIcon),
        suffixIcon: _buildSuffix(),
        filled: true,
        fillColor: colorScheme.surface,
        border: _border(colorScheme.outlineVariant),
        enabledBorder: _border(colorScheme.outlineVariant),
        disabledBorder: _border(colorScheme.outlineVariant),
        focusedBorder: _border(colorScheme.primary, width: 2),
        errorBorder: _border(colorScheme.error),
        focusedErrorBorder: _border(colorScheme.error, width: 2),
      ),
    );
  }
}
