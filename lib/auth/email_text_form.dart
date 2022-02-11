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
    return Flexible(
      child: Container(
        margin: const EdgeInsets.only(top: 4),
        height: 70,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
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
                return "Email Cannot Be Empty";
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
        ),
      ),
    );
  }
}
