import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:app_ui_kit_showcase/widgets/placeholder_block.dart';
import 'package:flutter/material.dart';

class ListTemplateDemo extends StatelessWidget {
  const ListTemplateDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppListTemplate(
      title: 'title · título de la pantalla',
      header: const PlaceholderBlock(label: 'header · búsqueda o filtros'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: <Widget>[
          for (int index = 1; index <= 5; index++) ...<Widget>[
            PlaceholderBlock(label: 'body · elemento $index', height: 72),
            const SizedBox(height: AppSpacing.sm),
          ],
        ],
      ),
    );
  }
}
