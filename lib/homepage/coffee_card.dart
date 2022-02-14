import 'package:coffee_journal/widgets/taste_note_chip.dart';
import 'package:flutter/material.dart';

class CoffeeCard extends StatelessWidget {
  final String coffeeName;
  final List<dynamic> tasteNotes;

  const CoffeeCard(
      {required this.coffeeName, required this.tasteNotes, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [getCoffeeName(), getTasteNotes()],
      ),
    );
  }

  Text getCoffeeName() => Text(coffeeName);

  Wrap getTasteNotes() {
    return Wrap(
      spacing: 8,
      children: allTasteNotes,
    );
  }

  List<Widget> get allTasteNotes =>
      [for (String tasteNote in tasteNotes) TasteNoteChip(label: tasteNote)];
}
