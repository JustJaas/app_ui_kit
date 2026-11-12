import 'package:flutter/material.dart';

class ShowcaseItem {
  const ShowcaseItem({
    required this.title,
    required this.description,
    required this.builder,
  });

  final String title;
  final String description;
  final WidgetBuilder builder;
}
