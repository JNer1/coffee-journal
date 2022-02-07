import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'coffee_card.dart';

class CoffeeList extends StatefulWidget {
  const CoffeeList({Key? key}) : super(key: key);

  @override
  _CoffeeListState createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList> {
  final Stream _coffeeListStream =
      FirebaseFirestore.instance.collection('coffee').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
        stream: _coffeeListStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            showErrorMessage();
          }
          return CustomScrollView(reverse: false, slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(8),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                var doc = snapshot.data.docs[index];

                return CoffeeCard(
                  coffeeName: doc.get('name'),
                  tasteNotes: doc.get('tasteNotes'),
                );
              }, childCount: snapshot.data.docs.length)),
            ),
          ]);
        });
  }

  Column showErrorMessage() {
    return Column(
      children: const [
        Icon(
          Icons.error,
          color: Colors.orange,
        ),
        Text('Something went wrong')
      ],
    );
  }
}
