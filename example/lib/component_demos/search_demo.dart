import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:app_ui_kit_showcase/widgets/variant_block.dart';
import 'package:flutter/material.dart';

class SearchDemo extends StatefulWidget {
  const SearchDemo({super.key});

  @override
  State<SearchDemo> createState() => _SearchDemoState();
}

class _SearchDemoState extends State<SearchDemo> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: AppSpacing.screenPadding,
      children: <Widget>[
        VariantBlock(
          title: 'Campo de búsqueda',
          description: 'Escribe: aparece el botón para limpiar',
          child: AppSearchField(
            hint: 'Buscar personajes',
            onChanged: (String value) => setState(() => _query = value),
          ),
        ),
        VariantBlock(
          title: 'Texto recibido',
          child: Text('"$_query"', style: textTheme.bodyLarge),
        ),
      ],
    );
  }
}
