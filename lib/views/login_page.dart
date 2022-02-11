import 'package:flutter/material.dart';
import '../auth/login_button.dart';
import '../auth/register_button.dart';
import '../widgets/user_details.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _userDetailsKey = GlobalKey<FormState>();
  final _loginButtonKey = GlobalKey();

  String loginStatus = "";
  bool? isFormValidated = false;

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
                  Form(
                      key: _userDetailsKey,
                      onChanged: () {
                        setState(() {
                          _userDetailsKey.currentState!.validate()
                              ? isFormValidated = true
                              : isFormValidated = false;
                        });
                      },
                      child: UserDetails(
                          emailController: emailController,
                          passwordController: passwordController)),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoginButton(
                          isValidated: isFormValidated,
                          key: _loginButtonKey,
                          emailController: emailController,
                          passwordController: passwordController,
                          onPressed: (String? status) {
                            checkForLoginError(status, context);
                          },
                        ),
                        RegisterButton(
                            emailController: emailController,
                            passwordController: passwordController)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void printValidationStatus() {
    {
      if (_userDetailsKey.currentState?.validate() == true) {
        print('True');
      }
      if (isFormValidated == false) {
        print('False');
      }
      if (_userDetailsKey.currentState?.validate() == null) {
        print("Null");
      }
    }
  }

  void showErrorMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      loginStatus,
      textAlign: TextAlign.center,
    )));
  }

  void checkForLoginError(String? status, BuildContext context) {
    {
      setState(() => loginStatus = status!);
      bool hasError = loginStatus != "Logged In";
      if (hasError) {
        showErrorMessage(context);
      }
    }
  }
}
