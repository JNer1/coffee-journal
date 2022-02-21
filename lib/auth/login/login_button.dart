import 'package:flutter/material.dart';
import '../authentication_service.dart';

import 'package:provider/provider.dart';

class LoginButton extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function(String?) onPressed;
  final Function(bool) checkIsLoading;
  final GlobalKey<FormState> loginFormKey;

  const LoginButton(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.onPressed,
      required this.checkIsLoading,
      required this.loginFormKey})
      : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  String? status = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.only(top: 28),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          bool isValidated = widget.loginFormKey.currentState!.validate();
          if (isValidated) {
            widget.checkIsLoading(true);
            await login(context);
            checkforLoginError();
          }
        },
        child: const Text('Log In'),
      ),
    );
  }

  Future<void> login(BuildContext context) async {
    status = await (BuildContext context) {
      Future<String?> status = context.read<AuthenticationService>().login(
          email: widget.emailController.text.trim(),
          password: widget.passwordController.text.trim());
      return status;
    }(context);
  }

  void checkforLoginError() {
    bool hasLoginError = status != "Logged In";
    if (hasLoginError) {
      widget.checkIsLoading(false);
    }
    widget.onPressed(status);
  }
}
