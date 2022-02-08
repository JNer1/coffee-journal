import 'package:flutter/material.dart';

class PasswordTextForm extends StatefulWidget {
  const PasswordTextForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  State<PasswordTextForm> createState() => _PasswordTextFormState();
}

class _PasswordTextFormState extends State<PasswordTextForm> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.only(top: 4),
        height: 70,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: TextFormField(
            obscureText: true,
            controller: widget.controller,
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (widget.controller.text.length > 5) return null;
              return "Password must be at least 6 characters long";
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
        ),
      ),
    );
  }
}
