import 'package:coffee_journal/auth/google_login_button.dart';
import 'package:coffee_journal/auth/register_authentication_wrapper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../auth/login_button.dart';
import '../auth/login_details_fields.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _loginButtonKey = GlobalKey();
  final _loginFormKey = GlobalKey<FormState>();

  String loginStatus = "";
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            height: 510,
            child: Card(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text(
                              'Log In',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Form(
                            key: _loginFormKey,
                            child: LoginDetailsFields(
                                emailController: emailController,
                                passwordController: passwordController),
                          ),
                          LoginButton(
                            key: _loginButtonKey,
                            loginFormKey: _loginFormKey,
                            emailController: emailController,
                            passwordController: passwordController,
                            isLoadingStatus: (bool isLoadingStatus) =>
                                setState(() => isLoading = isLoadingStatus),
                            onPressed: (String? status) {
                              checkForLoginError(status, context);
                            },
                          ),
                          const OrDivider(),
                          const GoogleLoginButton(),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: RichText(
                                text: TextSpan(children: [
                                  const TextSpan(
                                      text: 'No account yet? ',
                                      style: TextStyle(color: Colors.black)),
                                  TextSpan(
                                    text: "Register",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = (() => Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(
                                              builder: (context) =>
                                                  const RegisterAuthenticationWrapper()))),
                                    style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
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

class OrDivider extends StatelessWidget {
  const OrDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.only(top: 16),
        child: Text(
          'or',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
