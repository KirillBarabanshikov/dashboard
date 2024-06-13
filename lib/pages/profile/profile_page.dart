import 'package:dashboard/shared/services/hive_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../entities/session/session.dart';
import '../../shared/constants/constants.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  SessionUser? sessionUser;

  @override
  void initState() {
    sessionUser = HiveService.getSessionUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: () async {
              await ref.read(sessionProvider).signOut();
              if (context.mounted) context.go('/');
            },
            tooltip: 'Выход',
            color: Colors.red,
            icon: const Icon(Icons.logout),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1100) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 50, right: 50, top: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: sessionUser?.photoUrl == null
                        ? Image.asset(
                            kIsWeb ? 'images/profile.png' : 'assets/images/profile.png',
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            sessionUser!.photoUrl!,
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
                            Text(
                              sessionUser?.displayName ?? '',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            FilledButton(
                              onPressed: () => context.go('/profile-edit'),
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
                        Text(sessionUser?.dateBirth ?? 'Не указано', style: const TextStyle(fontSize: 16)),
                        const SizedBox(height: 20),
                        Text('E-mail:', style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.6))),
                        Text(sessionUser?.email ?? 'Не указано', style: const TextStyle(fontSize: 16)),
                        const SizedBox(height: 20),
                        Text('Телефон', style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.6))),
                        Text(sessionUser?.phone ?? 'Не указано', style: const TextStyle(fontSize: 16)),
                        const SizedBox(height: 20),
                        Text('Место проживания', style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.6))),
                        Text(sessionUser?.position ?? 'Не указано', style: const TextStyle(fontSize: 16)),
                        const SizedBox(height: 20),
                        Text('Пол', style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.6))),
                        Text(sessionUser?.gender ?? 'Не указано', style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FilledButton(
                    onPressed: () => context.go('/profile-edit'),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.edit),
                        SizedBox(width: 5),
                        Text('Редактировать профиль'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: sessionUser?.photoUrl == null
                        ? Image.asset(
                            kIsWeb ? 'images/profile.png' : 'assets/images/profile.png',
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            sessionUser!.photoUrl!,
                            fit: BoxFit.cover,
                          ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    sessionUser?.displayName ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text('Дата рождения:', style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.6))),
                  Text(sessionUser?.dateBirth ?? 'Не указано', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 15),
                  Text('E-mail:', style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.6))),
                  Text(sessionUser?.email ?? 'Не указано', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 15),
                  Text('Телефон', style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.6))),
                  Text(sessionUser?.phone ?? 'Не указано', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 15),
                  Text('Место проживания', style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.6))),
                  Text(sessionUser?.position ?? 'Не указано', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 15),
                  Text('Пол', style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.6))),
                  Text(sessionUser?.gender ?? 'Не указано', style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
