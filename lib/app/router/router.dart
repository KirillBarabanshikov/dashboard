import 'package:dashboard/shared/providers/firebase_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../pages/pages.dart';
import '../layouts/layouts.dart';

part 'router.g.dart';

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

      if (!isAuth) {
        return '/';
      } else if (state.uri.path == '/') {
        return '/indicators';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const LoginPage();
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
            path: '/indicators',
            builder: (context, state) {
              return const IndicatorsPage();
            },
          ),
          GoRoute(
            path: '/store-rating',
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
