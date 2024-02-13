import 'package:flutter/material.dart';

class LaunchTile extends StatelessWidget {
  const LaunchTile({
    super.key,
    this.url,
    required this.title,
    this.subtitle,
  });

  final String? url;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      // trailing: const Icon(Icons.chevron_right_rounded),
      // onTap: () => AppHelpers.launchUrl(url),
    );
  }
}
