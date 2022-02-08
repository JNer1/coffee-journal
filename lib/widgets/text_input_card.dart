import 'package:flutter/material.dart';

class TextInputCard extends StatelessWidget {
  const TextInputCard({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.only(top: 4),
        height: 70,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: TextField(
              controller: controller,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: label),
            ),
          ),
        ),
      ),
    );
  }
}
