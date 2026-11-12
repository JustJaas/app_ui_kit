# app_ui_kit

Sistema de diseño para **Flutter**: tokens (colores, espaciados, radios, tipografías), tema claro y oscuro y
componentes reutilizables organizados con **Atomic Design**. Incluye una app **showcase** donde se ve cada componente
funcionando con todas sus variantes.

## Ejemplo

https://github.com/user-attachments/assets/599d0594-17de-4e3e-b7b7-31103866e7d6

## Ejecutar y probar

```bash
git clone https://github.com/JustJaas/app_ui_kit.git
cd app_ui_kit

dart pub get
dart analyze        
dart test           
```

## Instalación

### Requisitos

- **Flutter 3.24 o superior** (incluye Dart 3.5 o superior).
- **Git** instalado, porque el paquete se descarga desde GitHub.
- Plataformas: Android, iOS, web, macOS, Windows y Linux (el paquete solo usa widgets de Flutter).

### Opción 1: con un comando (recomendada)

Dentro de la carpeta de tu proyecto:

```bash
flutter pub add app_ui_kit \
  --git-url=https://github.com/JustJaas/app_ui_kit.git \
  --git-ref=v0.1.0
```

### Opción 2: editando el `pubspec.yaml`

Agrega esto en `dependencies:` (respeta la indentación):

```yaml
dependencies:
  flutter:
    sdk: flutter

  app_ui_kit:
    git:
      url: https://github.com/JustJaas/app_ui_kit.git
      ref: v0.1.0   # etiqueta de la versión que quieres usar
```

Luego descarga el paquete:

```bash
flutter pub get
```

### Comprobar que quedó instalado

En el `main.dart` de tu app:

```dart
import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      home: Scaffold(
        body: Center(
          child: AppButton(label: 'Funciona', onPressed: () {}),
        ),
      ),
    ),
  );
}
```

Ejecuta `flutter run`: debe verse un botón verde con el texto "Funciona".

## Uso rápido

**1. Aplica el tema una sola vez**, en el `MaterialApp`:

```dart
MaterialApp(
  theme: AppTheme.light(),
  darkTheme: AppTheme.dark(),
  themeMode: ThemeMode.system,
  home: const MiPantalla(),
);
```

**2. Usa los componentes y los tokens en tus pantallas:**

```dart
Padding(
  padding: AppSpacing.screenPadding,
  child: Column(
    children: <Widget>[
      const AppTextField(label: 'Correo', hint: 'nombre@ejemplo.com'),
      const SizedBox(height: AppSpacing.md),
      AppButton(
        label: 'Continuar',
        isExpanded: true,
        onPressed: () {},
      ),
    ],
  ),
)
```

**3. Lee el tema, no escribas colores fijos:**

```dart
final ColorScheme colorScheme = Theme.of(context).colorScheme;
final TextTheme textTheme = Theme.of(context).textTheme;

Text('Título', style: textTheme.titleMedium?.copyWith(color: colorScheme.primary));
```

## Showcase

La app de `example/` muestra cada componente con todas sus variantes, organizada por categorías:

| Categoría | Contenido |
|---|---|
| **Fundamentos** | Colores, tipografía, espaciado y radios |
| **Átomos** | Botones, campos de texto, chips, loaders, badges |
| **Moléculas** | Cards, banners, campo de búsqueda |
| **Organismos** | Estados vacío y de error |

Además, el botón de la barra superior alterna entre tema claro y oscuro.

## Licencia

MIT. Ver [LICENSE](LICENSE).

