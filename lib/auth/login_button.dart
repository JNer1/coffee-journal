import 'package:flutter/material.dart';
import 'authentication_service.dart';

import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => login(context),
      child: const Text('Log In'),
    );
  }

  void login(BuildContext context) {
    context.read<AuthenticationService>().login(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }
}
