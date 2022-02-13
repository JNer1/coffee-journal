import 'package:flutter/material.dart';
import 'authentication_service.dart';

import 'package:provider/provider.dart';

class LoginButton extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function(String?) onPressed;
  final Function(bool) isLoadingStatus;
  final GlobalKey<FormState> loginFormKey;

  const LoginButton(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.onPressed,
      required this.isLoadingStatus,
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
        onPressed: () {
          if (widget.loginFormKey.currentState!.validate()) {
            widget.isLoadingStatus(true);
            login(context);
          }
        },
        child: const Text('Log In'),
      ),
    );
  }

  Future<void> login(BuildContext context) async {
    // showDialog(
    //     context: context,
    //     builder: (context) => const Center(
    //           child: CircularProgressIndicator.adaptive(),
    //         ));
    status = await tryLogin(context);
    if (status != "Logged In") {
      widget.isLoadingStatus(false);
    }
    widget.onPressed(status);
    // Navigator.of(context).pop();
  }

  Future<String?> tryLogin(BuildContext context) {
    Future<String?> status = context.read<AuthenticationService>().login(
        email: widget.emailController.text.trim(),
        password: widget.passwordController.text.trim());
    return status;
  }
}
