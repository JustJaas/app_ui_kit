import 'package:flutter/material.dart';

/// Colores **primitivos** del sistema de diseño.
///
/// Es el único lugar donde se escriben valores de color concretos. Los
/// componentes no usan estos colores directamente: `AppTheme` los asigna a
/// roles (primary, error, surface...) y los componentes leen esos roles con
/// `Theme.of(context)`.
class AppPalette {
  /// Verde de marca 100 (fondos suaves).
  static const Color green100 = Color(0xFFD3EBDC);

  /// Verde de marca 300 (versión clara para el tema oscuro).
  static const Color green300 = Color(0xFF7FD3A4);

  /// Verde de marca 600 (color principal del tema claro).
  static const Color green600 = Color(0xFF1B7F4B);

  /// Verde de marca 900 (texto sobre fondos verdes claros).
  static const Color green900 = Color(0xFF0B3B22);

  /// Gris azulado 100.
  static const Color slate100 = Color(0xFFDDE6EA);

  /// Gris azulado 300.
  static const Color slate300 = Color(0xFFB5C9D3);

  /// Gris azulado 600 (color secundario del tema claro).
  static const Color slate600 = Color(0xFF4A6572);

  /// Gris azulado 900.
  static const Color slate900 = Color(0xFF0F1E26);

  /// Rojo 100 (fondo de errores).
  static const Color red100 = Color(0xFFFFDAD6);

  /// Rojo 300 (errores en el tema oscuro).
  static const Color red300 = Color(0xFFFFB4AB);

  /// Rojo 600 (errores en el tema claro).
  static const Color red600 = Color(0xFFBA1A1A);

  /// Rojo 900 (texto sobre fondos rojos claros).
  static const Color red900 = Color(0xFF410002);

  /// Ámbar 100 (fondo de advertencias).
  static const Color amber100 = Color(0xFFFFE8C2);

  /// Ámbar 300 (advertencias en el tema oscuro).
  static const Color amber300 = Color(0xFFFFC46B);

  /// Ámbar 600 (advertencias en el tema claro).
  static const Color amber600 = Color(0xFFB26A00);

  /// Ámbar 900 (texto sobre fondos ámbar claros).
  static const Color amber900 = Color(0xFF4A2B00);

  /// Azul 100 (fondo de mensajes informativos).
  static const Color blue100 = Color(0xFFD6E8FB);

  /// Azul 300 (información en el tema oscuro).
  static const Color blue300 = Color(0xFF9CC8F5);

  /// Azul 600 (información en el tema claro).
  static const Color blue600 = Color(0xFF0B6BCB);

  /// Azul 900 (texto sobre fondos azules claros).
  static const Color blue900 = Color(0xFF062B52);

  /// Verde de éxito 100 (fondo de mensajes de éxito).
  static const Color success100 = Color(0xFFD7EDD8);

  /// Verde de éxito 300 (éxito en el tema oscuro).
  static const Color success300 = Color(0xFF81C784);

  /// Verde de éxito 600 (éxito en el tema claro).
  static const Color success600 = Color(0xFF2E7D32);

  /// Verde de éxito 900 (texto sobre fondos de éxito claros).
  static const Color success900 = Color(0xFF0A3D0D);

  /// Blanco.
  static const Color neutral0 = Color(0xFFFFFFFF);

  /// Neutro 50 (fondo de pantallas en el tema claro).
  static const Color neutral50 = Color(0xFFF3F6F4);

  /// Neutro 100 (superficies suaves y texto en el tema oscuro).
  static const Color neutral100 = Color(0xFFE3E9E5);

  /// Neutro 300 (bordes suaves y texto secundario en el tema oscuro).
  static const Color neutral300 = Color(0xFFC4CCC7);

  /// Neutro 500 (bordes y elementos desactivados).
  static const Color neutral500 = Color(0xFF79847D);

  /// Neutro 700 (texto secundario en el tema claro).
  static const Color neutral700 = Color(0xFF4F5953);

  /// Neutro 800 (superficies altas en el tema oscuro).
  static const Color neutral800 = Color(0xFF2B312E);

  /// Neutro 850 (superficie principal en el tema oscuro).
  static const Color neutral850 = Color(0xFF1F2421);

  /// Neutro 900 (texto principal en el tema claro).
  static const Color neutral900 = Color(0xFF1A1C1B);

  /// Neutro 950 (el fondo más oscuro del tema oscuro).
  static const Color neutral950 = Color(0xFF0F1210);

  /// Negro (sombras y fondos de diálogos).
  static const Color black = Color(0xFF000000);
}
