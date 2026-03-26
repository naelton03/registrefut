import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  const AuthState({required this.isOnboarded, required this.isAuthenticated});
  final bool isOnboarded;
  final bool isAuthenticated;

  AuthState copyWith({bool? isOnboarded, bool? isAuthenticated}) => AuthState(
        isOnboarded: isOnboarded ?? this.isOnboarded,
        isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      );
}

class AuthController extends StateNotifier<AuthState> {
  AuthController() : super(const AuthState(isOnboarded: false, isAuthenticated: false));

  void completeOnboarding() => state = state.copyWith(isOnboarded: true);
  void login() => state = state.copyWith(isAuthenticated: true);
  void logout() => state = state.copyWith(isAuthenticated: false);
}

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>((ref) => AuthController());
