import 'package:flutter/widgets.dart';

/// Escala de espaciado (base de 4 px). Úsala para márgenes, paddings y
/// separaciones en lugar de escribir números sueltos.
class AppSpacing {
  /// 4 px: separación mínima entre elementos muy relacionados.
  static const double xs = 4;

  /// 8 px: separación entre elementos de un mismo grupo.
  static const double sm = 8;

  /// 16 px: espaciado estándar (padding interno de tarjetas y campos).
  static const double md = 16;

  /// 24 px: separación entre grupos.
  static const double lg = 24;

  /// 32 px: separación entre secciones.
  static const double xl = 32;

  /// 48 px: separación grande (estados vacíos, cabeceras).
  static const double xxl = 48;

  /// Margen recomendado alrededor del contenido de una pantalla.
  static const EdgeInsets screenPadding = EdgeInsets.all(md);
}
