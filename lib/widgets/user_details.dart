import 'package:coffee_journal/widgets/email_text_field.dart';
import 'package:flutter/material.dart';

import 'password_text_field.dart';

class UserDetails extends StatefulWidget {
  final dynamic emailController, passwordController;
  const UserDetails(
      {required this.emailController,
      required this.passwordController,
      Key? key})
      : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          EmailTextField(
            controller: widget.emailController,
          ),
          PasswordTextField(
            controller: widget.passwordController,
          ),
        ],
      ),
    );
  }
}
