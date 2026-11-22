import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:app_ui_kit_showcase/widgets/variation_menu.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const List<String> _variations = <String>[
    'Normal',
    'Errores de validación',
    'Enviando',
    'Error del servidor',
  ];

  int _variation = 0;

  @override
  Widget build(BuildContext context) {
    final bool hasValidationErrors = _variation == 1;
    final bool isSubmitting = _variation == 2;
    final bool hasServerError = _variation == 3;

    return AppFormTemplate(
      appBarTitle: 'Iniciar sesión',
      title: 'Bienvenido de nuevo',
      description: 'Inicia sesión para ver tus pedidos y tu perfil.',
      actions: <Widget>[
        VariationMenu(
          labels: _variations,
          selectedIndex: _variation,
          onSelected: (int value) => setState(() => _variation = value),
        ),
      ],
      banner: hasServerError
          ? const AppBanner(
              type: AppStatusType.error,
              title: 'No pudimos iniciar sesión',
              message:
                  'El servidor no respondió. Inténtalo de nuevo en unos minutos.',
            )
          : null,
      fields: <Widget>[
        AppTextField(
          label: 'Correo',
          hint: 'nombre@ejemplo.com',
          prefixIcon: Icons.mail_outline,
          keyboardType: TextInputType.emailAddress,
          errorText: hasValidationErrors ? 'Ingresa un correo válido' : null,
        ),
        AppTextField(
          label: 'Contraseña',
          isPassword: true,
          errorText:
              hasValidationErrors ? 'Debe tener al menos 8 caracteres' : null,
        ),
      ],
      primaryAction: AppButton(
        label: isSubmitting ? 'Ingresando...' : 'Iniciar sesión',
        isLoading: isSubmitting,
        isExpanded: true,
        onPressed: () {},
      ),
      secondaryAction: AppButton(
        label: 'Crear una cuenta',
        variant: AppButtonVariant.text,
        isExpanded: true,
        onPressed: () {},
      ),
    );
  }
}
