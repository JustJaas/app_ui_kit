import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:app_ui_kit_showcase/widgets/variation_menu.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const List<String> _variations = <String>[
    'Perfil completo',
    'Nombre muy largo',
    'Perfil incompleto',
    'Cargando',
  ];

  int _variation = 0;

  String get _name {
    return _variation == 1
        ? 'María del Carmen Fernández de la Cruz y Valdivia'
        : 'María Quispe';
  }

  Widget _buildHeader(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: <Widget>[
        AppAvatar(label: _name, size: AppAvatarSize.large),
        const SizedBox(height: AppSpacing.md),
        Text(
          _name,
          textAlign: TextAlign.center,
          style: textTheme.headlineSmall,
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'maria.quispe@ejemplo.com',
          style: textTheme.bodyMedium?.copyWith(color: colorScheme.outline),
        ),
        const SizedBox(height: AppSpacing.sm),
        const Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          alignment: WrapAlignment.center,
          children: <Widget>[
            AppBadge(label: 'Cuenta verificada', type: AppStatusType.success),
            AppBadge(label: 'Cliente frecuente'),
          ],
        ),
      ],
    );
  }

  Widget _infoRow(BuildContext context, String label, String value) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: textTheme.bodyMedium?.copyWith(color: colorScheme.outline),
            ),
          ),
          Expanded(child: Text(value, style: textTheme.bodyMedium)),
        ],
      ),
    );
  }

  Widget _buildInfoSection(BuildContext context, bool isIncomplete) {
    return AppSection(
      title: 'Información',
      child: AppCard(
        variant: AppCardVariant.outlined,
        child: Column(
          children: <Widget>[
            _infoRow(
              context,
              'Teléfono',
              isIncomplete ? 'No registrado' : '+51 984 123 456',
            ),
            _infoRow(context, 'Ciudad', 'Cusco'),
            _infoRow(context, 'Miembro desde', 'Marzo de 2024'),
          ],
        ),
      ),
    );
  }

  Widget _buildActivitySection() {
    return AppSection(
      title: 'Actividad reciente',
      actionLabel: 'Ver todo',
      onAction: () {},
      child: const Column(
        children: <Widget>[
          AppListItem(
            title: 'Pedido #1042 entregado',
            subtitle: 'Hace 2 días',
            leading: Icon(Icons.check_circle_outline),
          ),
          SizedBox(height: AppSpacing.sm),
          AppListItem(
            title: 'Reseña publicada',
            subtitle: 'Hace 1 semana',
            leading: Icon(Icons.rate_review_outlined),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isIncomplete = _variation == 2;
    final bool isLoading = _variation == 3;

    return AppDetailTemplate(
      title: 'Mi perfil',
      actions: <Widget>[
        VariationMenu(
          labels: _variations,
          selectedIndex: _variation,
          onSelected: (int value) => setState(() => _variation = value),
        ),
      ],
      banner: isIncomplete
          ? AppBanner(
              type: AppStatusType.warning,
              title: 'Completa tu perfil',
              message: 'Agrega tu teléfono para recibir avisos de tus pedidos.',
              actionLabel: 'Completar',
              onAction: () {},
            )
          : null,
      header: _buildHeader(context),
      sections: isLoading
          ? const <Widget>[
              Center(child: AppLoader(message: 'Cargando actividad...')),
            ]
          : <Widget>[
              _buildInfoSection(context, isIncomplete),
              _buildActivitySection(),
            ],
      bottomAction: AppButton(
        label: 'Editar perfil',
        variant: AppButtonVariant.outlined,
        isExpanded: true,
        onPressed: () {},
      ),
    );
  }
}
