import 'package:flutter/material.dart';

class LoginPassowrdForm extends StatefulWidget {
  const LoginPassowrdForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  State<LoginPassowrdForm> createState() => _LoginPassowrdFormState();
}

class _LoginPassowrdFormState extends State<LoginPassowrdForm> {
  final _passwordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: TextFormField(
        key: _passwordFormKey,
        obscureText: true,
        controller: widget.controller,
        textInputAction: TextInputAction.next,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (widget.controller.text.isEmpty) {
            return "Password required";
          }

          return null;
        },
        decoration: const InputDecoration(
          labelText: 'Password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
