import 'package:flutter/material.dart';
import 'authentication_service.dart';

import 'package:provider/provider.dart';

class RegisterButton extends StatefulWidget {
  final TextEditingController emailController,
      passwordController,
      confirmPasswordController;
  final Function(String?) onPressed;
  final GlobalKey<FormState> registerFormKey;

  const RegisterButton(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.onPressed,
      required this.registerFormKey})
      : super(key: key);

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  String? status = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          if (widget.registerFormKey.currentState!.validate()) {
            await register(context);
            if (status != "Registerd") {
              null;
            }
          }
        },
        child: const Text('Register'),
      ),
    );
  }

  Future<void> register(BuildContext context) async {
    status = await tryRegister(context);
    widget.onPressed(status);
    Navigator.of(context).pop();
  }

  Future<String?> tryRegister(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator.adaptive(),
            ));
    Future<String?> registerStatus = context
        .read<AuthenticationService>()
        .register(
            email: widget.emailController.text.trim(),
            password: widget.passwordController.text.trim());
    return registerStatus;
  }
}
