/// Sistema de diseño reutilizable para Flutter
///
/// - **Tokens:** [AppPalette], [AppSpacing], [AppRadius], [AppSizes],
///   [AppTypography].
/// - **Tema:** [AppTheme] (claro y oscuro) y [AppSemanticColors].
/// - **Átomos:** [AppButton], [AppTextField], [AppChip], [AppLoader],
///   [AppBadge].
/// - **Moléculas:** [AppCard], [AppBanner], [AppSearchField].
/// - **Organismos:** [AppEmptyState], [AppErrorState].
///
/// ```dart
/// MaterialApp(
///   theme: AppTheme.light(),
///   darkTheme: AppTheme.dark(),
///   home: Scaffold(
///     body: AppButton(label: 'Guardar', onPressed: () {}),
///   ),
/// );
/// ```
library;

export 'src/atoms/app_badge.dart';
export 'src/atoms/app_button.dart';
export 'src/atoms/app_button_size.dart';
export 'src/atoms/app_button_variant.dart';
export 'src/atoms/app_chip.dart';
export 'src/atoms/app_loader.dart';
export 'src/atoms/app_loader_size.dart';
export 'src/atoms/app_text_field.dart';
export 'src/common/app_status_type.dart';
export 'src/molecules/app_banner.dart';
export 'src/molecules/app_card.dart';
export 'src/molecules/app_card_variant.dart';
export 'src/molecules/app_search_field.dart';
export 'src/organisms/app_empty_state.dart';
export 'src/organisms/app_error_state.dart';
export 'src/theme/app_semantic_colors.dart';
export 'src/theme/app_status_colors.dart';
export 'src/theme/app_theme.dart';
export 'src/tokens/app_palette.dart';
export 'src/tokens/app_radius.dart';
export 'src/tokens/app_sizes.dart';
export 'src/tokens/app_spacing.dart';
export 'src/tokens/app_typography.dart';
