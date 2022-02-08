import 'package:coffee_journal/auth/authentication_service.dart';
import 'package:coffee_journal/widgets/user_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 350,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserDetails(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  Flexible(
                    child: TextButton(
                        onPressed: login, child: const Text('Log In')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  login() {
    context.read<AuthenticationService>().login(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }

  register() {
    context.read<AuthenticationService>().register(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }
}
