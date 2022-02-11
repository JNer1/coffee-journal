import 'package:coffee_journal/views/homepage.dart';
import 'package:coffee_journal/views/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = Provider.of<User?>(context);

    if (firebaseUser != null) {
      return const HomepageScreen();
    }
    if (firebaseUser == null) {
      return const LoginPage();
    }

    return const CircularProgressIndicator.adaptive();
  }
}
