import 'package:coffee_journal/auth/confirm_password_text_form.dart';
import 'package:coffee_journal/auth/email_text_form.dart';
import 'package:flutter/material.dart';

import 'password_text_form.dart';

class RegisterDetailsFields extends StatefulWidget {
  final dynamic emailController, passwordController, confirmPasswordController;

  const RegisterDetailsFields(
      {required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController,
      Key? key})
      : super(key: key);

  @override
  _RegisterDetailsFieldsState createState() => _RegisterDetailsFieldsState();
}

class _RegisterDetailsFieldsState extends State<RegisterDetailsFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EmailTextForm(
          controller: widget.emailController,
        ),
        PasswordTextForm(
          controller: widget.passwordController,
        ),
        ConfirmPasswordTextForm(
          controller: widget.confirmPasswordController,
          passwordController: widget.passwordController,
        )
      ],
    );
  }
}
