import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:app_ui_kit_showcase/widgets/placeholder_block.dart';
import 'package:flutter/material.dart';

class DetailTemplateDemo extends StatelessWidget {
  const DetailTemplateDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppDetailTemplate(
      title: 'title · título de la pantalla',
      banner: PlaceholderBlock(label: 'banner · aviso opcional'),
      header: PlaceholderBlock(
          label: 'header · identidad del elemento', height: 140),
      sections: <Widget>[
        PlaceholderBlock(label: 'sections · sección 1', height: 120),
        PlaceholderBlock(label: 'sections · sección 2', height: 120),
      ],
      bottomAction: PlaceholderBlock(
          label: 'bottomAction · acción fija al pie', height: 48),
    );
  }
}
