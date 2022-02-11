import 'package:flutter/material.dart';
import 'authentication_service.dart';

import 'package:provider/provider.dart';

class RegisterButton extends StatefulWidget {
  const RegisterButton({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => register(context),
      child: const Text('Register'),
    );
  }

  void register(BuildContext context) {
    context.read<AuthenticationService>().register(
        email: widget.emailController.text.trim(),
        password: widget.passwordController.text.trim());
  }
}
