import 'package:flutter/material.dart';

class LoginEmailTextForm extends StatefulWidget {
  const LoginEmailTextForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  State<LoginEmailTextForm> createState() => _LoginEmailTextFormState();
}

class _LoginEmailTextFormState extends State<LoginEmailTextForm> {
  final _emailFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: TextFormField(
        key: _emailFormKey,
        controller: widget.controller,
        textInputAction: TextInputAction.next,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (widget.controller.text.isEmpty) {
            return "Email is required";
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'Email',
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
