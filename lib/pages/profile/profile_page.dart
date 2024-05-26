import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../entities/session/session.dart';
import '../../shared/constants/constants.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go(Routes.indicators.path),
          tooltip: 'Назад',
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Профиль'),
        actions: [
          IconButton(
            onPressed: () => ref.read(sessionProvider).signOut(),
            tooltip: 'Выход',
            color: Colors.red,
            icon: const Icon(Icons.logout),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
