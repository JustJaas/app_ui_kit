import 'package:app_ui_kit/app_ui_kit.dart';

class OrdersSampleData {
  static const List<(String, String, String, AppStatusType)> orders =
      <(String, String, String, AppStatusType)>[
    (
      'Pedido #1042',
      '3 productos · S/ 45.90',
      'Entregado',
      AppStatusType.success
    ),
    ('Pedido #1041', '1 producto · S/ 12.50', 'En camino', AppStatusType.info),
    (
      'Pedido #1040',
      '5 productos · S/ 128.00',
      'Pago pendiente',
      AppStatusType.warning
    ),
    (
      'Pedido #1039',
      '2 productos · S/ 33.20',
      'Cancelado',
      AppStatusType.error
    ),
    (
      'Pedido #1038',
      '4 productos · S/ 76.40',
      'Entregado',
      AppStatusType.success
    ),
  ];

  static const List<(String, String, String, AppStatusType)> longOrders =
      <(String, String, String, AppStatusType)>[
    (
      'Pedido #1050 de cafetera italiana de acero inoxidable con filtro reutilizable y accesorios de limpieza',
      'Entrega programada para la próxima semana en el almacén central de la ciudad de Cusco, segundo piso',
      'En camino',
      AppStatusType.info,
    ),
    (
      'Pedido #1049',
      '2 productos · S/ 1,250.00 · pago contra entrega con verificación de identidad requerida',
      'Pago pendiente',
      AppStatusType.warning,
    ),
  ];
}
