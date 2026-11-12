import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

/// Envuelve un widget con el tema del kit para poder probarlo.
class TestApp {
  /// Devuelve una app mínima que muestra [child] con el tema claro.
  static Widget wrap(Widget child) {
    return MaterialApp(
      theme: AppTheme.light(),
      home: Scaffold(body: Center(child: child)),
    );
  }
}
