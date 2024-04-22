import 'package:go_router/go_router.dart';

import '../../pages/pages.dart';
import '../layouts/layouts.dart';

final router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return BaseLayout(
          currentPath: state.uri.path,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/',
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
