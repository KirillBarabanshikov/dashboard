import 'package:flutter/material.dart';

import '../../features/reset_password/reset_password.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(30),
            child: const ResetPasswordForm(),
          ),
        ),
      ),
    );
  }
}
