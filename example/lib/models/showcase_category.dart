import 'package:app_ui_kit_showcase/models/showcase_item.dart';
import 'package:flutter/material.dart';

class ShowcaseCategory {
  const ShowcaseCategory({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.items,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final List<ShowcaseItem> items;
}
