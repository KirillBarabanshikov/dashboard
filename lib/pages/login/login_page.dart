import 'package:flutter/material.dart';

import '../../features/login/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(30),
            child: const LoginForm(),
          ),
        ),
      ),
    );
  }
}
