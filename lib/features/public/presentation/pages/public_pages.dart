import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../features/championship/presentation/controllers/championship_controller.dart';
import '../../../../shared/widgets/app_widgets.dart';
import '../../../../shared/widgets/placeholder_page.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final championships = ref.watch(championshipsProvider);
    return AppScaffold(
      title: 'Início',
      body: ListView(
        children: [
          const TextField(decoration: InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Buscar campeonato...')),
          const SizedBox(height: 16),
          const AppSectionHeader('Campeonatos em destaque'),
          championships.when(
            data: (items) => Column(
              children: items
                  .map((c) => ChampionshipCard(title: c.name, subtitle: '${c.sport} • ${c.city} • ${c.status}'))
                  .toList(),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => const AppEmptyState(message: 'Erro ao carregar campeonatos'),
          ),
        ],
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) => const PlaceholderPage(title: 'Buscar', description: 'Tabs: campeonatos e organizadores');
}

class OrganizerPublicProfileScreen extends StatelessWidget {
  const OrganizerPublicProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => const PlaceholderPage(title: 'Perfil do Organizador');
}

class ChampionshipPublicDetailScreen extends StatelessWidget {
  const ChampionshipPublicDetailScreen({super.key});
  @override
  Widget build(BuildContext context) => const PlaceholderPage(title: 'Página Pública do Campeonato');
}

class FollowingChampionshipsScreen extends StatelessWidget {
  const FollowingChampionshipsScreen({super.key});
  @override
  Widget build(BuildContext context) => const PlaceholderPage(title: 'Campeonatos Seguidos');
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
  @override
  Widget build(BuildContext context) => const PlaceholderPage(title: 'Notificações');
}

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => const PlaceholderPage(title: 'Perfil');
}
