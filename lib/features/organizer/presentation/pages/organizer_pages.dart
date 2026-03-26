import 'package:flutter/material.dart';

import '../../../../shared/widgets/app_widgets.dart';
import '../../../../shared/widgets/placeholder_page.dart';

class OrganizerDashboardScreen extends StatelessWidget {
  const OrganizerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Dashboard do Organizador',
      body: ListView(
        children: const [
          Text('Olá, Ana 👋'),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              SizedBox(width: 170, child: SummaryMetricCard(label: 'Campeonatos ativos', value: '1')),
              SizedBox(width: 170, child: SummaryMetricCard(label: 'Jogos pendentes', value: '4')),
              SizedBox(width: 170, child: SummaryMetricCard(label: 'Equipes', value: '12')),
              SizedBox(width: 170, child: SummaryMetricCard(label: 'Seguidores', value: '347')),
            ],
          ),
        ],
      ),
    );
  }
}

class MyChampionshipsScreen extends StatelessWidget {
  const MyChampionshipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Meus Campeonatos',
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      body: ListView(
        children: const [
          ChampionshipCard(title: 'Copa Metropolitana', subtitle: 'Futebol • Em andamento • São Paulo'),
          ChampionshipCard(title: 'Liga de Verão', subtitle: 'Futsal • Rascunho • Santos'),
        ],
      ),
    );
  }
}

class ChampionshipCreationWizardScreen extends StatefulWidget {
  const ChampionshipCreationWizardScreen({super.key});

  @override
  State<ChampionshipCreationWizardScreen> createState() => _ChampionshipCreationWizardScreenState();
}

class _ChampionshipCreationWizardScreenState extends State<ChampionshipCreationWizardScreen> {
  int step = 0;
  final labels = const ['Tipo', 'Modalidade', 'Informações', 'Formato', 'Revisão'];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Criar Campeonato',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LinearProgressIndicator(value: (step + 1) / 5),
          const SizedBox(height: 12),
          Text('Etapa ${step + 1}/5: ${labels[step]}'),
          const Spacer(),
          Row(
            children: [
              if (step > 0)
                OutlinedButton(onPressed: () => setState(() => step--), child: const Text('Voltar')),
              const Spacer(),
              FilledButton(
                onPressed: () {
                  if (step < 4) {
                    setState(() => step++);
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Text(step == 4 ? 'Criar campeonato' : 'Próximo'),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ChampionshipAdminDetailScreen extends StatelessWidget {
  const ChampionshipAdminDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = const [
      Tab(text: 'Visão geral'),
      Tab(text: 'Equipes'),
      Tab(text: 'Fases'),
      Tab(text: 'Rodadas'),
      Tab(text: 'Partidas'),
      Tab(text: 'Tabela'),
      Tab(text: 'Estatísticas'),
      Tab(text: 'Página pública'),
      Tab(text: 'Configurações'),
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(title: const Text('Admin do Campeonato'), bottom: TabBar(isScrollable: true, tabs: tabs)),
        body: const TabBarView(
          children: [
            Center(child: Text('Visão geral')),
            TeamsScreen(),
            PhasesScreen(),
            RoundsScreen(),
            MatchesScreen(),
            StandingsScreen(),
            StatisticsScreen(),
            ChampionshipPublicPreviewScreen(),
            ChampionshipSettingsScreen(),
          ],
        ),
      ),
    );
  }
}

class TeamsScreen extends StatelessWidget { const TeamsScreen({super.key}); @override Widget build(BuildContext context) => const PlaceholderPage(title: 'Equipes'); }
class TeamFormScreen extends StatelessWidget { const TeamFormScreen({super.key}); @override Widget build(BuildContext context) => const PlaceholderPage(title: 'Formulário de Equipe'); }
class TeamDetailScreen extends StatelessWidget { const TeamDetailScreen({super.key}); @override Widget build(BuildContext context) => const PlaceholderPage(title: 'Detalhe da Equipe'); }
class PhasesScreen extends StatelessWidget { const PhasesScreen({super.key}); @override Widget build(BuildContext context) => const PlaceholderPage(title: 'Fases'); }
class RoundsScreen extends StatelessWidget { const RoundsScreen({super.key}); @override Widget build(BuildContext context) => const PlaceholderPage(title: 'Rodadas'); }
class MatchesScreen extends StatelessWidget { const MatchesScreen({super.key}); @override Widget build(BuildContext context) => const PlaceholderPage(title: 'Partidas: Lista/Tabela/Calendário'); }
class MatchFormScreen extends StatelessWidget { const MatchFormScreen({super.key}); @override Widget build(BuildContext context) => const PlaceholderPage(title: 'Formulário da Partida'); }
class MatchResultScreen extends StatelessWidget { const MatchResultScreen({super.key}); @override Widget build(BuildContext context) => const PlaceholderPage(title: 'Resultado da Partida'); }
class StandingsScreen extends StatelessWidget { const StandingsScreen({super.key}); @override Widget build(BuildContext context) => const PlaceholderPage(title: 'Tabela de Classificação'); }
class StatisticsScreen extends StatelessWidget { const StatisticsScreen({super.key}); @override Widget build(BuildContext context) => const PlaceholderPage(title: 'Estatísticas'); }
class ChampionshipPublicPreviewScreen extends StatelessWidget { const ChampionshipPublicPreviewScreen({super.key}); @override Widget build(BuildContext context) => const PlaceholderPage(title: 'Prévia Pública'); }
class ChampionshipSettingsScreen extends StatelessWidget { const ChampionshipSettingsScreen({super.key}); @override Widget build(BuildContext context) => const PlaceholderPage(title: 'Configurações'); }
