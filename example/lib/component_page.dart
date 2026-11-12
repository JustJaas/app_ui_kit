import 'package:app_ui_kit_showcase/models/showcase_item.dart';
import 'package:flutter/material.dart';

class ComponentPage extends StatelessWidget {
  const ComponentPage({super.key, required this.item});

  final ShowcaseItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      body: item.builder(context),
    );
  }
}
