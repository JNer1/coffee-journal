import 'package:flutter/material.dart';
import 'authentication_service.dart';

import 'package:provider/provider.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => register(context),
      child: const Text('Register'),
    );
  }

  void register(BuildContext context) {
    context.read<AuthenticationService>().register(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }
}
