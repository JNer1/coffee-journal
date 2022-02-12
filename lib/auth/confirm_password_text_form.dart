import 'package:flutter/material.dart';

class ConfirmPasswordTextForm extends StatefulWidget {
  const ConfirmPasswordTextForm(
      {Key? key, required this.controller, required this.passwordController})
      : super(key: key);

  final TextEditingController controller, passwordController;

  @override
  State<ConfirmPasswordTextForm> createState() =>
      _ConfirmPasswordTextFormState();
}

class _ConfirmPasswordTextFormState extends State<ConfirmPasswordTextForm> {
  final _confirmPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextFormField(
        key: _confirmPasswordFormKey,
        obscureText: true,
        controller: widget.controller,
        textInputAction: TextInputAction.next,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (widget.controller.text == widget.passwordController.text) {
            return null;
          }

          return "Does not match password";
        },
        decoration: const InputDecoration(
          labelText: 'Confirm Password',
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
