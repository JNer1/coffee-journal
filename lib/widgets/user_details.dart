import 'package:coffee_journal/auth/email_text_form.dart';
import 'package:flutter/material.dart';

import '../auth/password_text_form.dart';

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
          EmailTextForm(
            controller: widget.emailController,
          ),
          PasswordTextForm(
            controller: widget.passwordController,
          ),
        ],
      ),
    );
  }
}
