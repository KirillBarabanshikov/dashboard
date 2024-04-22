import 'package:flutter/material.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Dashboard',
      theme: theme,
      routerConfig: router,
    );
  }
}
