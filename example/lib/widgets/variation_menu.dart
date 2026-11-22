import 'package:flutter/material.dart';

class VariationMenu extends StatelessWidget {
  const VariationMenu({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      tooltip: 'Variaciones',
      icon: const Icon(Icons.tune),
      initialValue: selectedIndex,
      onSelected: onSelected,
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<int>>[
          for (int index = 0; index < labels.length; index++)
            PopupMenuItem<int>(value: index, child: Text(labels[index])),
        ];
      },
    );
  }
}
