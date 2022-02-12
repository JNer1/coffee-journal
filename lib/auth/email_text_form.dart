import 'package:flutter/material.dart';

import 'package:email_validator/email_validator.dart';

class EmailTextForm extends StatefulWidget {
  const EmailTextForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  State<EmailTextForm> createState() => _EmailTextFormState();
}

class _EmailTextFormState extends State<EmailTextForm> {
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
          if (EmailValidator.validate(widget.controller.text)) {
            return null;
          }
          if (widget.controller.text.isEmpty) {
            return "Email is required";
          }
          return "Please Enter Valid Email";
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
