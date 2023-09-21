import 'package:chrip_aid/auth/model/service/auth_service.dart';
import 'package:chrip_aid/auth/model/state/auth_state.dart';
import 'package:chrip_aid/common/state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final authProvider = ChangeNotifierProvider<AuthProvider>((ref) => AuthProvider(ref: ref));

class AuthProvider extends ChangeNotifier {
  final Ref ref;

  AuthProvider({
    required this.ref,
  }) {
    ref.listen<AuthState>(authServiceProvider, (previous, next) {
      if(previous != next) notifyListeners();
    });
  }

  String? redirectLogic(BuildContext context, GoRouterState state) {
    final AuthState authState = ref.read(authServiceProvider);
    final isLoginScreen = state.location.contains('/auth');

    if(authState is NoneState) {
      return isLoginScreen ? null : '/auth';
    }

    if(authState is SuccessState) {
      return isLoginScreen || state.location == '/splash' ? '/' : null;
    }

    if(authState is ErrorState) {
      return !isLoginScreen ? '/auth' : null;
    }

    return null;
  }

  void logout() {
    ref.read(authServiceProvider.notifier).logout();
  }
}