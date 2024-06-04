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
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 50, right: 50, top: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                'images/profile.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 50),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Барабанщиков Кирилл Дмириевич',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      FilledButton(
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Icon(Icons.edit),
                            SizedBox(width: 5),
                            Text('Редактировать профиль'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Text('Дата рождения:', style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.6))),
                  const Text('24.02.2004', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 20),
                  Text('E-mail:', style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.6))),
                  const Text('lilkirill2020@gmail.com', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 20),
                  Text('Телефон', style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.6))),
                  const Text('89828167454', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
