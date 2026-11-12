# Lineamientos visuales

Reglas básicas del sistema de diseño `app_ui_kit`. Su objetivo es que todas las pantallas de una app se vean y se
comporten igual, sin que cada pantalla tenga que decidir colores, espacios o tamaños.

## 1. Principios

1. Consistencia: el mismo problema se resuelve siempre con el mismo componente. Si necesitas un botón, usas `AppButton`.
2. Un solo lugar para cada decisión: los colores viven en `AppPalette`, los espacios en `AppSpacing`, los textos en `AppTypography`.
3. Estilos separados de las pantallas: una pantalla compone componentes; no define colores, tamaños ni estilos.
4. Funciona en claro y oscuro: ningún componente escribe un color fijo; todos leen el tema.
5. Simple primero: cada componente tiene pocas variantes con nombres claros.

## 2. De dónde sale cada valor (tokens en dos niveles)

| Nivel | Qué es | Dónde está | ¿Se usa en componentes? |
|---|---|---|---|
| **Primitivos** | Valores sueltos: `green600`, `neutral900`... | `AppPalette` | **No** |
| **Semánticos** | Roles con significado: `primary`, `error`, `surface`... | `AppTheme` (`ColorScheme`) y `AppSemanticColors` | **Sí**, con `Theme.of(context)` |

Ejemplo: un componente nunca escribe `AppPalette.green600`; escribe `Theme.of(context).colorScheme.primary`. Así, el mismo componente usa `green600` en el tema claro y `green300` en el oscuro sin cambiar una línea.

## 3. Color

| Rol | Cuándo usarlo |
|---|---|
| `primary` / `onPrimary` | Acción principal y elementos de marca |
| `secondary` / `secondaryContainer` | Acciones y fondos de menor énfasis |
| `surface` | Fondo de tarjetas y campos |
| `surfaceContainerLow` | Fondo de las pantallas |
| `outline` / `outlineVariant` | Bordes y separadores |
| `onSurface` / `onSurfaceVariant` | Texto principal / texto secundario |
| `error` y `errorContainer` | Errores y acciones destructivas |
| `AppSemanticColors` | Éxito, advertencia e información |

**Reglas:**
- No escribir `Colors.xxx` ni `Color(0x...)` fuera de `AppPalette`.
- Cada color de fondo va acompañado de su color `on...` para el texto (por ejemplo, `primary` con `onPrimary`).
- El color nunca debe ser la única forma de comunicar algo: un error lleva también un ícono o un texto.

## 4. Espaciado

Escala basada en una cuadrícula de **4 px**:

| Token | Valor | Uso típico |
|---|---|---|
| `AppSpacing.xs` | 4 | Entre elementos muy relacionados |
| `AppSpacing.sm` | 8 | Dentro de un mismo grupo |
| `AppSpacing.md` | 16 | Padding estándar (tarjetas, campos, pantallas) |
| `AppSpacing.lg` | 24 | Entre grupos |
| `AppSpacing.xl` | 32 | Entre secciones |
| `AppSpacing.xxl` | 48 | Estados vacíos y cabeceras |

No escribir números sueltos como `EdgeInsets.all(13)`: usar siempre un token.

## 5. Radios de borde

| Token | Valor | Uso |
|---|---|---|
| `AppRadius.sm` | 8 | Elementos pequeños |
| `AppRadius.md` | 12 | Botones, campos y banners |
| `AppRadius.lg` | 16 | Tarjetas |
| `AppRadius.pill` | 999 | Chips y badges |

## 6. Tipografía

| Estilo | Uso |
|---|---|
| `headlineLarge/Medium/Small` | Títulos de pantalla |
| `titleLarge/Medium/Small` | Títulos de secciones y tarjetas |
| `bodyLarge/Medium/Small` | Texto corrido |
| `labelLarge/Medium/Small` | Botones, etiquetas y badges |

Se obtienen con `Theme.of(context).textTheme`. No se define `fontSize` ni `fontWeight` a mano.

## 7. Accesibilidad básica

- Áreas táctiles: los botones miden 36 / 44 / 52 px de alto; en pantallas táctiles se recomienda 44 px o más.
- Contraste: cada color de fondo se combina con su color `on...`, pensados para ser legibles.
- Etiquetas: los botones de solo ícono deben llevar `tooltip`.

## 8. Atomic Design: qué va en cada nivel y qué puede usar

| Nivel | Qué es | Ejemplos | Puede usar |
|---|---|---|---|
| **Tokens** | Valores base | `AppPalette`, `AppSpacing` | Nada |
| **Átomos** | Elementos indivisibles | `AppButton`, `AppTextField`, `AppChip`, `AppLoader`, `AppBadge` | Tokens y tema |
| **Moléculas** | Combinación pequeña de átomos | `AppCard`, `AppBanner`, `AppSearchField` | Átomos, tokens y tema |
| **Organismos** | Sección completa de interfaz | `AppEmptyState`, `AppErrorState` | Moléculas, átomos, tokens y tema |

Regla de dependencia: un nivel solo puede usar niveles por debajo de él. Un átomo nunca usa una molécula.
Las plantillas y páginas (el siguiente nivel de Atomic Design) pertenecen a cada app, no al paquete.

## 9. Cómo agregar un componente nuevo

1. Decide su nivel (átomo, molécula u organismo) y créalo en la carpeta correspondiente de `lib/src/`.
2. Colores, espacios y estilos solo desde tokens y tema. Sin valores sueltos.
3. Una clase por archivo; las variantes (`enum`) van en su propio archivo.
4. Documenta con `///` todo lo público (el linter lo exige).
5. Expórtalo en `lib/app_ui_kit.dart`.
6. Agrega una prueba en `test/`.
7. Agrega su página en el showcase (`example/`), con todas sus variantes.
8. Anótalo en `CHANGELOG.md` y sube la versión según corresponda (nuevo componente = MINOR).
