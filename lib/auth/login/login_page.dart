import 'package:flutter/material.dart';
import 'login_card.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: LoginCard(),
        ),
      ),
    );
  }
}
