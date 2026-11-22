import 'package:flutter/material.dart';

class ShowcaseItem {
  const ShowcaseItem({
    required this.title,
    required this.description,
    required this.builder,
    this.isFullScreen = false,
  });

  final String title;
  final String description;
  final WidgetBuilder builder;

  final bool isFullScreen;
}
