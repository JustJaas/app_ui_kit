import 'package:app_ui_kit/src/atoms/app_avatar_size.dart';
import 'package:app_ui_kit/src/tokens/app_sizes.dart';
import 'package:flutter/material.dart';

/// Círculo que identifica a una persona: muestra sus iniciales o, si no hay
/// nombre, un ícono.
class AppAvatar extends StatelessWidget {
  /// Crea un avatar. Con [label] muestra las iniciales (hasta dos letras);
  /// sin él, muestra [icon].
  const AppAvatar({
    super.key,
    this.label,
    this.icon = Icons.person_outline,
    this.size = AppAvatarSize.medium,
  });

  /// Nombre de la persona. De él se toman las iniciales.
  final String? label;

  /// Ícono que se muestra cuando no hay [label].
  final IconData icon;

  /// Tamaño del avatar.
  final AppAvatarSize size;

  double get _diameter {
    return switch (size) {
      AppAvatarSize.small => AppSizes.avatarSm,
      AppAvatarSize.medium => AppSizes.avatarMd,
      AppAvatarSize.large => AppSizes.avatarLg,
    };
  }

  double get _iconSize {
    return switch (size) {
      AppAvatarSize.small => AppSizes.iconSm,
      AppAvatarSize.medium => AppSizes.iconMd,
      AppAvatarSize.large => AppSizes.iconLg,
    };
  }

  TextStyle? _textStyle(TextTheme textTheme) {
    return switch (size) {
      AppAvatarSize.small => textTheme.labelMedium,
      AppAvatarSize.medium => textTheme.titleSmall,
      AppAvatarSize.large => textTheme.titleLarge,
    };
  }

  String get _initials {
    final String text = (label ?? '').trim();
    if (text.isEmpty) {
      return '';
    }
    final List<String> words = text.split(RegExp(r'\s+'));
    final String first = words.first.substring(0, 1).toUpperCase();
    if (words.length == 1) {
      return first;
    }
    return first + words[1].substring(0, 1).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final String initials = _initials;

    return Container(
      width: _diameter,
      height: _diameter,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        shape: BoxShape.circle,
      ),
      child: initials.isEmpty
          ? Icon(icon, size: _iconSize, color: colorScheme.onPrimaryContainer)
          : Text(
              initials,
              style: _textStyle(textTheme)?.copyWith(
                color: colorScheme.onPrimaryContainer,
              ),
            ),
    );
  }
}
