import 'package:coffee_journal/widgets/taste_note_chip.dart';
import 'package:flutter/material.dart';

class CoffeeCard extends StatelessWidget {
  final String name;
  final dynamic tasteNotes;

  const CoffeeCard({required this.name, required this.tasteNotes, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(name),
          Wrap(
            spacing: 8,
            children: allTasteNotes,
          )
        ],
      ),
    );
  }

  List<Widget> get allTasteNotes =>
      [for (var item in tasteNotes) TasteNoteChip(label: item)];
}
