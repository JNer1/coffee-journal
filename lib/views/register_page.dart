import 'package:coffee_journal/auth/login_authentication_wrapper.dart';
import 'package:coffee_journal/auth/register_details_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../auth/register_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _registerFormKey = GlobalKey<FormState>();

  String registerStatus = "";
  bool? isFormValidated = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            height: 500,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Register',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Form(
                      key: _registerFormKey,
                      child: RegisterDetailsFields(
                        emailController: emailController,
                        passwordController: passwordController,
                        confirmPasswordController: confirmPasswordController,
                      ),
                    ),
                    RegisterButton(
                      registerFormKey: _registerFormKey,
                      onPressed: (String? status) {
                        checkForRegisterError(status, context);
                      },
                      emailController: emailController,
                      passwordController: passwordController,
                      confirmPasswordController: confirmPasswordController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Center(
                        child: RichText(
                          text: TextSpan(children: [
                            const TextSpan(
                                text: 'Already have and account? ',
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                              text: "Log In",
                              recognizer: TapGestureRecognizer()
                                ..onTap = (() => Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginAuthenticationWrapper()))),
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
      registerStatus,
      textAlign: TextAlign.center,
    )));
  }

  void checkForRegisterError(String? status, BuildContext context) {
    {
      setState(() => registerStatus = status!);
      bool hasError = registerStatus != "Registered";
      if (hasError) {
        showErrorMessage(context);
      }
    }
  }
}
