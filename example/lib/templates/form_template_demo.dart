import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:app_ui_kit_showcase/widgets/placeholder_block.dart';
import 'package:flutter/material.dart';

class FormTemplateDemo extends StatelessWidget {
  const FormTemplateDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppFormTemplate(
      appBarTitle: 'appBarTitle · barra superior (opcional)',
      title: 'title · título del formulario',
      description: 'description · texto breve que explica qué se pide',
      banner:
          PlaceholderBlock(label: 'banner · mensaje opcional (error o aviso)'),
      fields: <Widget>[
        PlaceholderBlock(label: 'fields · campo 1', height: 56),
        PlaceholderBlock(label: 'fields · campo 2', height: 56),
        PlaceholderBlock(label: 'fields · campo 3', height: 56),
      ],
      primaryAction: PlaceholderBlock(
          label: 'primaryAction · acción principal', height: 48),
      secondaryAction: PlaceholderBlock(
          label: 'secondaryAction · acción secundaria (opcional)', height: 48),
    );
  }
}
