import 'package:app_ui_kit_showcase/models/showcase_category.dart';
import 'package:app_ui_kit_showcase/models/showcase_item.dart';
import 'package:app_ui_kit_showcase/pages/badges_page.dart';
import 'package:app_ui_kit_showcase/pages/banners_page.dart';
import 'package:app_ui_kit_showcase/pages/buttons_page.dart';
import 'package:app_ui_kit_showcase/pages/cards_page.dart';
import 'package:app_ui_kit_showcase/pages/chips_page.dart';
import 'package:app_ui_kit_showcase/pages/colors_page.dart';
import 'package:app_ui_kit_showcase/pages/loaders_page.dart';
import 'package:app_ui_kit_showcase/pages/search_page.dart';
import 'package:app_ui_kit_showcase/pages/spacing_page.dart';
import 'package:app_ui_kit_showcase/pages/states_page.dart';
import 'package:app_ui_kit_showcase/pages/text_fields_page.dart';
import 'package:app_ui_kit_showcase/pages/typography_page.dart';
import 'package:flutter/material.dart';

class ShowcaseCatalog {
  static final List<ShowcaseCategory> categories = <ShowcaseCategory>[
    ShowcaseCategory(
      title: 'Fundamentos',
      subtitle: 'Design tokens y tema',
      icon: Icons.palette_outlined,
      items: <ShowcaseItem>[
        ShowcaseItem(
          title: 'Colores',
          description: 'Roles de color del tema claro y oscuro',
          builder: (BuildContext context) => const ColorsPage(),
        ),
        ShowcaseItem(
          title: 'Tipografía',
          description: 'Escala de estilos de texto',
          builder: (BuildContext context) => const TypographyPage(),
        ),
        ShowcaseItem(
          title: 'Espaciado y radios',
          description: 'Escala de espacios y bordes redondeados',
          builder: (BuildContext context) => const SpacingPage(),
        ),
      ],
    ),
    ShowcaseCategory(
      title: 'Átomos',
      subtitle: 'Componentes básicos e indivisibles',
      icon: Icons.circle_outlined,
      items: <ShowcaseItem>[
        ShowcaseItem(
          title: 'Botones',
          description: 'Variantes, tamaños, íconos y estado de carga',
          builder: (BuildContext context) => const ButtonsPage(),
        ),
        ShowcaseItem(
          title: 'Campos de texto',
          description: 'Normal, con ayuda, con error y contraseña',
          builder: (BuildContext context) => const TextFieldsPage(),
        ),
        ShowcaseItem(
          title: 'Chips',
          description: 'Etiquetas, filtros seleccionables y eliminables',
          builder: (BuildContext context) => const ChipsPage(),
        ),
        ShowcaseItem(
          title: 'Loaders',
          description: 'Indicadores de carga en tres tamaños',
          builder: (BuildContext context) => const LoadersPage(),
        ),
        ShowcaseItem(
          title: 'Badges',
          description: 'Etiquetas de estado',
          builder: (BuildContext context) => const BadgesPage(),
        ),
      ],
    ),
    ShowcaseCategory(
      title: 'Moléculas',
      subtitle: 'Combinaciones de átomos',
      icon: Icons.bubble_chart_outlined,
      items: <ShowcaseItem>[
        ShowcaseItem(
          title: 'Cards',
          description: 'Elevada, con borde y rellena; pulsables',
          builder: (BuildContext context) => const CardsPage(),
        ),
        ShowcaseItem(
          title: 'Banners',
          description: 'Mensajes de información, éxito, advertencia y error',
          builder: (BuildContext context) => const BannersPage(),
        ),
        ShowcaseItem(
          title: 'Campo de búsqueda',
          description: 'Campo de texto con lupa y botón de limpiar',
          builder: (BuildContext context) => const SearchPage(),
        ),
      ],
    ),
    ShowcaseCategory(
      title: 'Organismos',
      subtitle: 'Secciones completas de interfaz',
      icon: Icons.view_agenda_outlined,
      items: <ShowcaseItem>[
        ShowcaseItem(
          title: 'Estados vacío y error',
          description: 'Mensajes cuando no hay datos o algo falla',
          builder: (BuildContext context) => const StatesPage(),
        ),
      ],
    ),
  ];
}
