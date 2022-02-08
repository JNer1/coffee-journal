import 'package:flutter/material.dart';

class TasteNoteChip extends StatelessWidget {
  final String label;

  const TasteNoteChip({required this.label, Key? key}) : super(key: key);

  Color? chipColor() {
    if (label == 'acidic') return const Color(0xffffe587);
    if (label == 'bold') return const Color(0xff808080);
    if (label == 'caramel') return const Color(0xffd59200);
    if (label == 'fermented') return const Color(0xffd279a6);
    if (label == 'fruity') return const Color(0xffffb380);
    if (label == 'light') return const Color(0xfff2e6d9);
    if (label == 'nutty') return const Color(0xffa6733f);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.all(4),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: chipColor(),
    );
  }
}
