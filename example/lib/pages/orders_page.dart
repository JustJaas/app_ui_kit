import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:app_ui_kit_showcase/data/orders_sample_data.dart';
import 'package:app_ui_kit_showcase/widgets/variation_menu.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  static const List<String> _variations = <String>[
    'Con datos',
    'Un solo pedido',
    'Textos largos',
    'Cargando',
    'Vacío',
    'Error de red',
  ];

  int _variation = 0;

  List<(String, String, String, AppStatusType)> get _orders {
    return switch (_variation) {
      1 => OrdersSampleData.orders.take(1).toList(),
      2 => OrdersSampleData.longOrders,
      _ => OrdersSampleData.orders,
    };
  }

  Widget _buildList() {
    final List<(String, String, String, AppStatusType)> orders = _orders;

    return ListView.separated(
      padding: const EdgeInsets.only(bottom: AppSpacing.xxl),
      itemCount: orders.length,
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: AppSpacing.sm),
      itemBuilder: (BuildContext context, int index) {
        final (String title, String detail, String status, AppStatusType type) =
            orders[index];
        return AppListItem(
          title: title,
          subtitle: detail,
          leading: const Icon(Icons.receipt_long_outlined),
          trailing: AppBadge(label: status, type: type),
          onTap: () {},
        );
      },
    );
  }

  Widget _buildBody() {
    return switch (_variation) {
      3 => const Center(child: AppLoader(message: 'Cargando pedidos...')),
      4 => AppEmptyState(
          title: 'Aún no tienes pedidos',
          message: 'Cuando hagas tu primera compra aparecerá aquí.',
          icon: Icons.shopping_bag_outlined,
          actionLabel: 'Explorar productos',
          onAction: () {},
        ),
      5 => AppErrorState(message: 'Sin conexión a internet.', onRetry: () {}),
      _ => _buildList(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return AppListTemplate(
      title: 'Mis pedidos',
      actions: <Widget>[
        VariationMenu(
          labels: _variations,
          selectedIndex: _variation,
          onSelected: (int value) => setState(() => _variation = value),
        ),
      ],
      header: const AppSearchField(hint: 'Buscar pedido'),
      body: _buildBody(),
    );
  }
}
