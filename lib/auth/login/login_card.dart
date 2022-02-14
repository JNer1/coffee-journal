import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'or_divider.dart';
import 'google_login_button.dart';
import 'login_button.dart';
import 'login_details_fields.dart';
import '../register/register_authentication_wrapper.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({Key? key}) : super(key: key);

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
    return SizedBox(
      height: 510,
      child: Card(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Padding(
                padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      loginFormKey: _loginFormKey,
                      emailController: emailController,
                      passwordController: passwordController,
                      checkIsLoading: (bool isLoadingStatus) =>
                          setState(() => isLoading = isLoadingStatus),
                      onPressed: (String? status) {
                        {
                          loginStatus = status.toString();
                          bool hasError = loginStatus != "Logged In";
                          if (hasError) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                              loginStatus,
                              textAlign: TextAlign.center,
                            )));
                          }
                        }
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
                                ..onTap = (() =>
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterAuthenticationWrapper(),
                                      ),
                                    )),
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
    );
  }
}
