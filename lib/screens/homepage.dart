import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_journal/widgets/coffee_card.dart';
import 'package:flutter/material.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final Stream _coffeeCardStream =
      FirebaseFirestore.instance.collection('coffee').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Journal'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: _coffeeCardStream,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Column(
              children: const [
                Icon(
                  Icons.error,
                  color: Colors.orange,
                ),
                Text('Error')
              ],
            );
          }
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(8),
                sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return CoffeeCard(
                    coffeeName: snapshot.data.docs[index].get('name'),
                    tasteNotes: snapshot.data.docs[index].get('tasteNotes'),
                  );
                }, childCount: snapshot.data.docs.length)),
              )
            ],
          );
        },
      ),
    );
  }
}
