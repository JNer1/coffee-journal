import 'package:coffee_journal/chip_data.dart';
import 'package:flutter/material.dart';

class CoffeeCard extends StatefulWidget {
  const CoffeeCard({Key? key}) : super(key: key);

  @override
  State<CoffeeCard> createState() => _CoffeeCardState();
}

class _CoffeeCardState extends State<CoffeeCard> {
  final List<TasteChipData> _allTasteChips = [];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: const [
          CoffeeName(),
        ],
      ),
    );
  }
}

class CoffeeName extends StatelessWidget {
  const CoffeeName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Coffee');
  }
}
