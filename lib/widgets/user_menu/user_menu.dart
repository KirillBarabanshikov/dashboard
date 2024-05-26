import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../entities/session/session.dart';
import '../../entities/user/user.dart';
import '../../shared/constants/routes.dart';
import '../../shared/services/services.dart';

class UserMenu extends ConsumerStatefulWidget {
  const UserMenu({super.key});

  @override
  ConsumerState createState() => _UserMenuState();
}

class _UserMenuState extends ConsumerState<UserMenu> {
  SessionUser? sessionUser;

  @override
  void initState() {
    sessionUser = HiveService.getSessionUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder: (context, controller, child) {
        return IconButton(
          onPressed: () => controller.isOpen ? controller.close() : controller.open(),
          padding: const EdgeInsets.all(5),
          icon: UserAvatar(
            displayName: sessionUser == null ? 'Кирилл Ба' : sessionUser!.displayName,
            photoUrl: sessionUser?.photoUrl,
          ),
        );
      },
      menuChildren: [
        MenuItemButton(
          onPressed: () => context.go(Routes.profile.path),
          leadingIcon: const Icon(Icons.person),
          child: const Text('Профиль'),
        ),
        MenuItemButton(
          onPressed: () async {
            await ref.read(sessionProvider).signOut();
            if (context.mounted) context.go('/');
          },
          style: MenuItemButton.styleFrom(
            foregroundColor: Colors.red,
            iconColor: Colors.red,
          ),
          leadingIcon: const Icon(Icons.logout),
          child: const Text('Выход'),
        ),
      ],
    );
  }
}
