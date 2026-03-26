import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/app_widgets.dart';
import '../controllers/auth_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(() => context.go('/onboarding'));
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      title: 'Bem-vindo',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Gerencie campeonatos com uma experiência premium.'),
          const Spacer(),
          FilledButton(
            onPressed: () {
              ref.read(authControllerProvider.notifier).completeOnboarding();
              context.go('/login');
            },
            child: const Text('Começar'),
          )
        ],
      ),
    );
  }
}

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      title: 'Entrar',
      body: Column(
        children: [
          const TextField(decoration: InputDecoration(labelText: 'E-mail')),
          const TextField(decoration: InputDecoration(labelText: 'Senha')),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () {
              ref.read(authControllerProvider.notifier).login();
              context.go('/home');
            },
            child: const Text('Login mockado'),
          ),
          TextButton(onPressed: () => context.go('/register'), child: const Text('Criar conta')),
          TextButton(onPressed: () => context.go('/forgot-password'), child: const Text('Esqueci a senha')),
        ],
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) => const AppScaffold(title: 'Registro', body: Text('Cadastro local/mockado'));
}

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) => const AppScaffold(title: 'Recuperar senha', body: Text('Fluxo local/mockado'));
}
