import 'package:app_ui_kit/src/tokens/app_palette.dart';
import 'package:flutter/material.dart';

/// Colores semánticos que `ColorScheme` no incluye: éxito, advertencia e
/// información. (El color de error ya existe en `ColorScheme`.)
///
/// Se registra como `ThemeExtension` en `AppTheme` y se lee con
/// [AppSemanticColors.of].
class AppSemanticColors extends ThemeExtension<AppSemanticColors> {
  /// Crea el conjunto de colores semánticos.
  const AppSemanticColors({
    required this.success,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.warning,
    required this.warningContainer,
    required this.onWarningContainer,
    required this.info,
    required this.infoContainer,
    required this.onInfoContainer,
  });

  /// Colores semánticos del tema claro.
  static const AppSemanticColors light = AppSemanticColors(
    success: AppPalette.success600,
    successContainer: AppPalette.success100,
    onSuccessContainer: AppPalette.success900,
    warning: AppPalette.amber600,
    warningContainer: AppPalette.amber100,
    onWarningContainer: AppPalette.amber900,
    info: AppPalette.blue600,
    infoContainer: AppPalette.blue100,
    onInfoContainer: AppPalette.blue900,
  );

  /// Colores semánticos del tema oscuro.
  static const AppSemanticColors dark = AppSemanticColors(
    success: AppPalette.success300,
    successContainer: AppPalette.success900,
    onSuccessContainer: AppPalette.success100,
    warning: AppPalette.amber300,
    warningContainer: AppPalette.amber900,
    onWarningContainer: AppPalette.amber100,
    info: AppPalette.blue300,
    infoContainer: AppPalette.blue900,
    onInfoContainer: AppPalette.blue100,
  );

  /// Obtiene los colores semánticos del tema actual. Si el tema no incluye la
  /// extensión (no se usó `AppTheme`), devuelve la versión clara.
  static AppSemanticColors of(BuildContext context) {
    return Theme.of(context).extension<AppSemanticColors>() ?? light;
  }

  /// Color principal de éxito.
  final Color success;

  /// Fondo de mensajes de éxito.
  final Color successContainer;

  /// Texto sobre [successContainer].
  final Color onSuccessContainer;

  /// Color principal de advertencia.
  final Color warning;

  /// Fondo de mensajes de advertencia.
  final Color warningContainer;

  /// Texto sobre [warningContainer].
  final Color onWarningContainer;

  /// Color principal de información.
  final Color info;

  /// Fondo de mensajes informativos.
  final Color infoContainer;

  /// Texto sobre [infoContainer].
  final Color onInfoContainer;

  @override
  AppSemanticColors copyWith({
    Color? success,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? warning,
    Color? warningContainer,
    Color? onWarningContainer,
    Color? info,
    Color? infoContainer,
    Color? onInfoContainer,
  }) {
    return AppSemanticColors(
      success: success ?? this.success,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      warning: warning ?? this.warning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
      info: info ?? this.info,
      infoContainer: infoContainer ?? this.infoContainer,
      onInfoContainer: onInfoContainer ?? this.onInfoContainer,
    );
  }

  @override
  AppSemanticColors lerp(ThemeExtension<AppSemanticColors>? other, double t) {
    if (other is! AppSemanticColors) {
      return this;
    }
    return AppSemanticColors(
      success: Color.lerp(success, other.success, t)!,
      successContainer: Color.lerp(successContainer, other.successContainer, t)!,
      onSuccessContainer:
          Color.lerp(onSuccessContainer, other.onSuccessContainer, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningContainer: Color.lerp(warningContainer, other.warningContainer, t)!,
      onWarningContainer:
          Color.lerp(onWarningContainer, other.onWarningContainer, t)!,
      info: Color.lerp(info, other.info, t)!,
      infoContainer: Color.lerp(infoContainer, other.infoContainer, t)!,
      onInfoContainer: Color.lerp(onInfoContainer, other.onInfoContainer, t)!,
    );
  }
}
