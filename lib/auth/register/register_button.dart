import 'package:flutter/material.dart';
import '../authentication_service.dart';

import 'package:provider/provider.dart';

class RegisterButton extends StatefulWidget {
  final TextEditingController emailController,
      passwordController,
      confirmPasswordController;
  final Function(String?) onPressed;
  final Function(bool) checkIsLoading;
  final GlobalKey<FormState> registerFormKey;

  const RegisterButton(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.onPressed,
      required this.checkIsLoading,
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
      height: 70,
      padding: const EdgeInsets.only(top: 32),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          bool isValidated = widget.registerFormKey.currentState!.validate();
          if (isValidated) {
            widget.checkIsLoading(true);

            await register(context);
            checkForRegistrationError();
          }
        },
        child: const Text('Register'),
      ),
    );
  }

  void checkForRegistrationError() {
    if (status != "Registered") {
      widget.checkIsLoading(false);
      widget.onPressed(status);
    }
  }

  Future<void> register(BuildContext context) async {
    status = await (BuildContext context) {
      Future<String?> registerStatus = context
          .read<AuthenticationService>()
          .register(
              email: widget.emailController.text.trim(),
              password: widget.passwordController.text.trim());
      return registerStatus;
    }(context);
  }
}
