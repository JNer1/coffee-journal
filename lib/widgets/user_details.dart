import 'package:flutter/material.dart';

import 'text_input_card.dart';

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
          TextInputCard(
            emailController: widget.emailController,
            label: 'Email',
          ),
          TextInputCard(
            emailController: widget.passwordController,
            label: 'Password',
          ),
        ],
      ),
    );
  }
}
