import 'package:flutter/material.dart';
import 'package:fulltimeforce_app/src/features/shared/ui/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/helpers/app_helpers.dart';
import '../../../../ui/utils/app_alerts.dart';

class DetailItem extends StatelessWidget {
  const DetailItem({
    super.key,
    required this.title,
    this.subtitle,
    this.url,
    this.textToCopy,
  });

  final String title;
  final String? subtitle;
  final String? url;
  final String? textToCopy;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleMedium;
    return ListTile(
      title: Text(title, style: style?.copyWith(fontWeight: FontWeight.bold)),
      subtitle: subtitle != null ? Text(subtitle!, style: style) : null,
      onTap: () => _onTap(context),
      trailing: _getTrailing(context),
    );
  }

  Widget? _getTrailing(BuildContext context) {
    final isDark = context.read<ThemeProvider>().isDark;
    final iconColor = isDark ? Colors.white : Colors.black;
    if (textToCopy != null) return Icon(Icons.content_copy, color: iconColor);
    if (url != null) return Icon(Icons.open_in_new, color: iconColor);
    return null;
  }

  void _onTap(BuildContext context) {
    if (textToCopy != null) {
      AppHelpers.copyToClipboard(textToCopy!);
      final messenger = ScaffoldMessenger.of(context);
      messenger.showSnackBar(AppAlerts.getSnackBar(msg: 'Copied to clipboard'));
      return;
    }
    if (url != null) {
      AppHelpers.launchUrl(url!);
      return;
    }
  }
}
