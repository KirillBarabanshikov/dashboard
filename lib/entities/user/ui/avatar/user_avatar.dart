import 'package:flutter/material.dart';

import '../../model/model.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final splitName = user.displayName.split(' ');
    final shortName = splitName.length >= 2 ? splitName[0][0] + splitName[1][0] : splitName[0][0];

    return CircleAvatar(
      foregroundImage: user.photoUrl != null ? NetworkImage(user.photoUrl!) : null,
      child: Text(shortName),
    );
  }
}
