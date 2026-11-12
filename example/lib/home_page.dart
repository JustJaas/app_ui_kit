import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:app_ui_kit_showcase/component_page.dart';
import 'package:app_ui_kit_showcase/models/showcase_catalog.dart';
import 'package:app_ui_kit_showcase/models/showcase_category.dart';
import 'package:app_ui_kit_showcase/models/showcase_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });

  final bool isDark;
  final VoidCallback onToggleTheme;

  List<Widget> _buildCategory(BuildContext context, ShowcaseCategory category) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return <Widget>[
      Row(
        children: <Widget>[
          Icon(category.icon, color: colorScheme.primary),
          const SizedBox(width: AppSpacing.sm),
          Expanded(child: Text(category.title, style: textTheme.titleMedium)),
          AppBadge(label: '${category.items.length}'),
        ],
      ),
      Text(
        category.subtitle,
        style: textTheme.bodySmall?.copyWith(color: colorScheme.outline),
      ),
      const SizedBox(height: AppSpacing.sm),
      for (final ShowcaseItem item in category.items) ...<Widget>[
        AppCard(
          variant: AppCardVariant.outlined,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => ComponentPage(item: item),
              ),
            );
          },
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(item.title, style: textTheme.titleSmall),
                    Text(
                      item.description,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
      ],
      const SizedBox(height: AppSpacing.md),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('app_ui_kit'),
        actions: <Widget>[
          IconButton(
            tooltip: isDark ? 'Usar tema claro' : 'Usar tema oscuro',
            icon: Icon(
              isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            ),
            onPressed: onToggleTheme,
          ),
        ],
      ),
      body: ListView(
        padding: AppSpacing.screenPadding,
        children: <Widget>[
          const AppBanner(
            title: 'Showcase del sistema de diseño',
            message:
                'Explora cada componente y sus variantes. Con el botón de arriba cambias entre tema claro y oscuro.',
          ),
          const SizedBox(height: AppSpacing.lg),
          for (final ShowcaseCategory category in ShowcaseCatalog.categories)
            ..._buildCategory(context, category),
        ],
      ),
    );
  }
}
