import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:app_ui_kit_showcase/widgets/variant_block.dart';
import 'package:flutter/material.dart';

class ChipsPage extends StatefulWidget {
  const ChipsPage({super.key});

  @override
  State<ChipsPage> createState() => _ChipsPageState();
}

class _ChipsPageState extends State<ChipsPage> {
  final Set<String> _selected = <String>{'Flutter'};
  final List<String> _tags = <String>['Dart', 'Flutter', 'Hive'];

  void _toggle(String label, bool value) {
    setState(() {
      if (value) {
        _selected.add(label);
      } else {
        _selected.remove(label);
      }
    });
  }

  void _removeTag(String tag) {
    setState(() => _tags.remove(tag));
  }

  void _resetTags() {
    setState(() {
      _tags
        ..clear()
        ..addAll(<String>['Dart', 'Flutter', 'Hive']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: AppSpacing.screenPadding,
      children: <Widget>[
        const VariantBlock(
          title: 'Solo lectura',
          child: Wrap(
            spacing: AppSpacing.sm,
            children: <Widget>[
              AppChip(label: 'Dart'),
              AppChip(label: 'Flutter', icon: Icons.flutter_dash),
            ],
          ),
        ),
        VariantBlock(
          title: 'Seleccionables',
          description: 'Útiles como filtros. Toca para seleccionar.',
          child: Wrap(
            spacing: AppSpacing.sm,
            children: <Widget>[
              for (final String label in <String>[
                'Flutter',
                'Dart',
                'Riverpod'
              ])
                AppChip(
                  label: label,
                  selected: _selected.contains(label),
                  onSelected: (bool value) => _toggle(label, value),
                ),
            ],
          ),
        ),
        VariantBlock(
          title: 'Eliminables',
          description: 'Toca la X para quitar una etiqueta',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Wrap(
                spacing: AppSpacing.sm,
                children: <Widget>[
                  for (final String tag in _tags)
                    AppChip(label: tag, onDeleted: () => _removeTag(tag)),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              AppButton(
                label: 'Restablecer',
                size: AppButtonSize.small,
                variant: AppButtonVariant.text,
                onPressed: _resetTags,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
