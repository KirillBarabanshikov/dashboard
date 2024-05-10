import 'package:dashboard/shared/providers/firebase_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../pages/pages.dart';
import '../../shared/constants/constants.dart';
import '../layouts/layouts.dart';

part 'router.g.dart';

final _unauthenticatedPaths = [
  Routes.main.path,
  Routes.resetPassword.path,
];
final _authenticatedPaths = [
  Routes.indicators.path,
  Routes.storeRating.path,
];

@riverpod
GoRouter router(RouterRef ref) {
  final ValueNotifier<User?> authStateNotifier = ValueNotifier(null);

  ref.listen(authStateChangesProvider, (_, state) {
    authStateNotifier.value = state.value;
  });

  final router = GoRouter(
    refreshListenable: authStateNotifier,
    redirect: (context, state) {
      final isAuth = ref.read(firebaseAuthProvider).currentUser != null;
      if (isAuth) {
        if (_unauthenticatedPaths.contains(state.fullPath)) return Routes.indicators.path;
      } else {
        if (_authenticatedPaths.contains(state.fullPath)) return Routes.main.path;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: Routes.main.path,
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: Routes.resetPassword.path,
        builder: (context, state) {
          return const ResetPasswordPage();
        },
      ),
      ShellRoute(
        builder: (context, state, child) {
          return BaseLayout(
            currentPath: state.uri.path,
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: Routes.indicators.path,
            builder: (context, state) {
              return const IndicatorsPage();
            },
          ),
          GoRoute(
            path: Routes.storeRating.path,
            builder: (context, state) {
              return const StoreRatingPage();
            },
          ),
        ],
      ),
    ],
  );

  return router;
}
