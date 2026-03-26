import 'package:flutter/material.dart';

import '../design_system/app_spacing.dart';
import '../design_system/app_text_styles.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.title, required this.body, this.actions});
  final String title;
  final Widget body;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), actions: actions),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: body,
      ),
    );
  }
}

class AppSectionHeader extends StatelessWidget {
  const AppSectionHeader(this.title, {super.key, this.trailing});
  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.title),
        if (trailing != null) trailing!,
      ],
    );
  }
}

class AppEmptyState extends StatelessWidget {
  const AppEmptyState({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message));
  }
}

class SummaryMetricCard extends StatelessWidget {
  const SummaryMetricCard({super.key, required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(value, style: AppTextStyles.heading),
        subtitle: Text(label),
      ),
    );
  }
}

class ChampionshipCard extends StatelessWidget {
  const ChampionshipCard({super.key, required this.title, required this.subtitle, this.onTap});
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(title: Text(title), subtitle: Text(subtitle), onTap: onTap),
    );
  }
}
