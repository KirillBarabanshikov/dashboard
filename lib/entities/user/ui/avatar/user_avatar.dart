import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.displayName,
    this.photoUrl,
  });

  final String displayName;
  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    final splitName = displayName.split(' ');
    final shortName = splitName.length >= 2 ? splitName[0][0] + splitName[1][0] : splitName[0][0];

    return CircleAvatar(
      backgroundColor: photoUrl != null ? Colors.transparent : Colors.orangeAccent.withOpacity(0.5),
      foregroundImage: photoUrl != null ? NetworkImage(photoUrl!) : null,
      child: photoUrl != null ? const SizedBox() : Text(shortName),
    );
  }
}
