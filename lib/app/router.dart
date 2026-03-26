import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/pages/auth_pages.dart';
import '../features/organizer/presentation/pages/organizer_pages.dart';
import '../features/public/presentation/pages/public_pages.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(path: '/splash', builder: (_, __) => const SplashScreen()),
      GoRoute(path: '/onboarding', builder: (_, __) => const OnboardingScreen()),
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      GoRoute(path: '/register', builder: (_, __) => const RegisterScreen()),
      GoRoute(path: '/forgot-password', builder: (_, __) => const ForgotPasswordScreen()),
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
          GoRoute(path: '/search', builder: (_, __) => const SearchScreen()),
          GoRoute(path: '/following', builder: (_, __) => const FollowingChampionshipsScreen()),
          GoRoute(path: '/notifications', builder: (_, __) => const NotificationsScreen()),
          GoRoute(path: '/profile', builder: (_, __) => const UserProfileScreen()),
        ],
      ),
      GoRoute(path: '/organizer-dashboard', builder: (_, __) => const OrganizerDashboardScreen()),
      GoRoute(path: '/my-championships', builder: (_, __) => const MyChampionshipsScreen()),
      GoRoute(path: '/championship-wizard', builder: (_, __) => const ChampionshipCreationWizardScreen()),
      GoRoute(path: '/championship-admin', builder: (_, __) => const ChampionshipAdminDetailScreen()),
      GoRoute(path: '/organizer-profile', builder: (_, __) => const OrganizerPublicProfileScreen()),
      GoRoute(path: '/championship-public', builder: (_, __) => const ChampionshipPublicDetailScreen()),
    ],
  );
});

class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.child});
  final Widget child;

  int _indexFor(String location) {
    if (location.startsWith('/search')) return 1;
    if (location.startsWith('/following')) return 2;
    if (location.startsWith('/notifications')) return 3;
    if (location.startsWith('/profile')) return 4;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _indexFor(location),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Início'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Buscar'),
          NavigationDestination(icon: Icon(Icons.emoji_events_outlined), label: 'Campeonatos'),
          NavigationDestination(icon: Icon(Icons.notifications_none), label: 'Notificações'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Perfil'),
        ],
        onDestinationSelected: (value) {
          const routes = ['/home', '/search', '/following', '/notifications', '/profile'];
          context.go(routes[value]);
        },
      ),
    );
  }
}
