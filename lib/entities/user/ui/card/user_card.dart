import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/model.dart';
import '../../provider/provider.dart';
import '../avatar/user_avatar.dart';

class UserCard extends ConsumerWidget {
  const UserCard({
    super.key,
    required this.user,
  });

  final UserModel user;

  void _onBlock(WidgetRef ref) {
    ref.read(usersProvider.notifier).block(user.uid);
  }

  void _onUnblock(WidgetRef ref) {
    ref.read(usersProvider.notifier).unblock(user.uid);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                UserAvatar(
                  displayName: user.displayName,
                  photoUrl: user.displayName,
                ),
                const SizedBox(width: 10),
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    user.displayName,
                    style: const TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                user.isBlocked
                    ? IconButton(
                        onPressed: () => _onUnblock(ref),
                        icon: const Icon(Icons.lock_outlined),
                        color: Colors.red,
                        tooltip: 'Разблокировать',
                      )
                    : IconButton(
                        onPressed: () => _onBlock(ref),
                        icon: const Icon(Icons.lock_open_outlined),
                        color: Colors.green,
                        tooltip: 'Заблокировать',
                      ),
              ],
            ),
            const SizedBox(height: 20),
            Text('Email: ${user.email}'),
            const SizedBox(height: 10),
            Text('Роль: ${user.role}'),
          ],
        ),
      ),
    );
  }
}
