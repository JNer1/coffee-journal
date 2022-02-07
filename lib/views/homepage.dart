import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/coffee_list.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Log out?'),
                    actions: [
                      TextButton(onPressed: logOut, child: const Text('Yes'))
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.arrow_upward))
        ],
        title: const Text('Coffee Journal'),
        centerTitle: true,
      ),
      body: const CoffeeList(),
    );
  }

  void logOut() {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pop();
  }
}
