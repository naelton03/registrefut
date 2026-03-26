import 'package:flutter/material.dart';

import 'app_widgets.dart';

class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({super.key, required this.title, this.description});
  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: title,
      body: Center(child: Text(description ?? title)),
    );
  }
}
