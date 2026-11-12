import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:app_ui_kit_showcase/widgets/variant_block.dart';
import 'package:flutter/material.dart';

class TextFieldsPage extends StatelessWidget {
  const TextFieldsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppSpacing.screenPadding,
      children: const <Widget>[
        VariantBlock(
          title: 'Básico',
          child: AppTextField(label: 'Nombre', hint: 'Escribe tu nombre'),
        ),
        VariantBlock(
          title: 'Con texto de ayuda',
          child: AppTextField(
            label: 'Correo',
            helperText: 'Usaremos este correo para avisarte',
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        VariantBlock(
          title: 'Con error',
          child: AppTextField(
            label: 'Correo',
            errorText: 'El correo no es válido',
          ),
        ),
        VariantBlock(
          title: 'Con ícono',
          child: AppTextField(
            label: 'Teléfono',
            prefixIcon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
          ),
        ),
        VariantBlock(
          title: 'Contraseña',
          description: 'Oculta el texto y permite mostrarlo',
          child: AppTextField(label: 'Contraseña', isPassword: true),
        ),
        VariantBlock(
          title: 'Deshabilitado',
          child: AppTextField(label: 'Usuario', enabled: false),
        ),
        VariantBlock(
          title: 'Varias líneas',
          child: AppTextField(label: 'Comentario', maxLines: 4),
        ),
      ],
    );
  }
}
