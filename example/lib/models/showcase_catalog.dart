import 'package:app_ui_kit_showcase/component_demos/badges_demo.dart';
import 'package:app_ui_kit_showcase/component_demos/banners_demo.dart';
import 'package:app_ui_kit_showcase/component_demos/buttons_demo.dart';
import 'package:app_ui_kit_showcase/component_demos/cards_demo.dart';
import 'package:app_ui_kit_showcase/component_demos/chips_demo.dart';
import 'package:app_ui_kit_showcase/component_demos/colors_demo.dart';
import 'package:app_ui_kit_showcase/component_demos/loaders_demo.dart';
import 'package:app_ui_kit_showcase/component_demos/search_demo.dart';
import 'package:app_ui_kit_showcase/component_demos/spacing_demo.dart';
import 'package:app_ui_kit_showcase/component_demos/states_demo.dart';
import 'package:app_ui_kit_showcase/component_demos/text_fields_demo.dart';
import 'package:app_ui_kit_showcase/component_demos/typography_demo.dart';
import 'package:app_ui_kit_showcase/models/showcase_category.dart';
import 'package:app_ui_kit_showcase/models/showcase_item.dart';
import 'package:app_ui_kit_showcase/pages/login_page.dart';
import 'package:app_ui_kit_showcase/pages/orders_page.dart';
import 'package:app_ui_kit_showcase/pages/profile_page.dart';
import 'package:app_ui_kit_showcase/templates/detail_template_demo.dart';
import 'package:app_ui_kit_showcase/templates/form_template_demo.dart';
import 'package:app_ui_kit_showcase/templates/list_template_demo.dart';
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
          builder: (BuildContext context) => const ColorsDemo(),
        ),
        ShowcaseItem(
          title: 'Tipografía',
          description: 'Escala de estilos de texto',
          builder: (BuildContext context) => const TypographyDemo(),
        ),
        ShowcaseItem(
          title: 'Espaciado y radios',
          description: 'Escala de espacios y bordes redondeados',
          builder: (BuildContext context) => const SpacingDemo(),
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
          builder: (BuildContext context) => const ButtonsDemo(),
        ),
        ShowcaseItem(
          title: 'Campos de texto',
          description: 'Normal, con ayuda, con error y contraseña',
          builder: (BuildContext context) => const TextFieldsDemo(),
        ),
        ShowcaseItem(
          title: 'Chips',
          description: 'Etiquetas, filtros seleccionables y eliminables',
          builder: (BuildContext context) => const ChipsDemo(),
        ),
        ShowcaseItem(
          title: 'Loaders',
          description: 'Indicadores de carga en tres tamaños',
          builder: (BuildContext context) => const LoadersDemo(),
        ),
        ShowcaseItem(
          title: 'Badges',
          description: 'Etiquetas de estado',
          builder: (BuildContext context) => const BadgesDemo(),
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
          builder: (BuildContext context) => const CardsDemo(),
        ),
        ShowcaseItem(
          title: 'Banners',
          description: 'Mensajes de información, éxito, advertencia y error',
          builder: (BuildContext context) => const BannersDemo(),
        ),
        ShowcaseItem(
          title: 'Campo de búsqueda',
          description: 'Campo de texto con lupa y botón de limpiar',
          builder: (BuildContext context) => const SearchDemo(),
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
          builder: (BuildContext context) => const StatesDemo(),
        ),
      ],
    ),
    ShowcaseCategory(
      title: 'Plantillas',
      subtitle: 'La estructura de una pantalla, con contenido de relleno',
      icon: Icons.dashboard_customize_outlined,
      items: <ShowcaseItem>[
        ShowcaseItem(
          title: 'Plantilla de lista',
          description: 'AppListTemplate: encabezado, cuerpo y botón flotante',
          isFullScreen: true,
          builder: (BuildContext context) => const ListTemplateDemo(),
        ),
        ShowcaseItem(
          title: 'Plantilla de formulario',
          description: 'AppFormTemplate: título, campos y acciones',
          isFullScreen: true,
          builder: (BuildContext context) => const FormTemplateDemo(),
        ),
        ShowcaseItem(
          title: 'Plantilla de detalle',
          description: 'AppDetailTemplate: cabecera, secciones y acción al pie',
          isFullScreen: true,
          builder: (BuildContext context) => const DetailTemplateDemo(),
        ),
      ],
    ),
    ShowcaseCategory(
      title: 'Páginas',
      subtitle: 'Plantillas con contenido real y sus variaciones',
      icon: Icons.article_outlined,
      items: <ShowcaseItem>[
        ShowcaseItem(
          title: 'Inicio de sesión',
          description:
              'Formulario: normal, con errores, enviando y error del servidor',
          isFullScreen: true,
          builder: (BuildContext context) => const LoginPage(),
        ),
        ShowcaseItem(
          title: 'Mis pedidos',
          description:
              'Lista: con datos, textos largos, cargando, vacío y error',
          isFullScreen: true,
          builder: (BuildContext context) => const OrdersPage(),
        ),
        ShowcaseItem(
          title: 'Mi perfil',
          description: 'Detalle: completo, nombre largo, incompleto y cargando',
          isFullScreen: true,
          builder: (BuildContext context) => const ProfilePage(),
        ),
      ],
    ),
  ];
}
