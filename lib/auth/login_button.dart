import 'package:flutter/material.dart';
import 'authentication_service.dart';

import 'package:provider/provider.dart';

class LoginButton extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function(String?) onPressed;
  final bool? isValidated;

  const LoginButton(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.onPressed,
      required this.isValidated})
      : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  String? status = "";
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    // });
    return TextButton(
      onPressed: widget.isValidated!
          ? () async {
              await login(context);
            }
          : null,
      child: const Text('Log In'),
    );
  }

  Future<void> login(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator.adaptive(),
            ));
    status = await tryLogin(context);
    widget.onPressed(status);
    Navigator.of(context).pop();
  }

  Future<String?> tryLogin(BuildContext context) {
    Future<String?> status = context.read<AuthenticationService>().login(
        email: widget.emailController.text.trim(),
        password: widget.passwordController.text.trim());
    return status;
  }
}
