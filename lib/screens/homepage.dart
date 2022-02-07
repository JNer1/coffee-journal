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
        title: const Text('Coffee Journal'),
        centerTitle: true,
      ),
      body: const CoffeeList(),
    );
  }
}
