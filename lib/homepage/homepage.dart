import 'package:coffee_journal/auth/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                showLogout(context);
              },
              icon: const Icon(Icons.arrow_upward))
        ],
        title: const Text('Coffee Journal'),
        centerTitle: true,
      ),
      body: const CoffeeList(),
    );
  }

  Future<dynamic> showLogout(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Log out?'),
        actions: [TextButton(onPressed: logOut, child: const Text('Yes'))],
      ),
    );
  }

  void logOut() {
    context.read<AuthenticationService>().logout();
    Navigator.of(context).pop();
  }
}
