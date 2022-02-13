import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'authentication_service.dart';

import 'package:provider/provider.dart';

class GoogleLoginButton extends StatefulWidget {
  const GoogleLoginButton({
    Key? key,
  }) : super(key: key);

  @override
  State<GoogleLoginButton> createState() => _GoogleLoginButtonState();
}

class _GoogleLoginButtonState extends State<GoogleLoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.only(top: 16),
      width: double.infinity,
      child: SignInButton(
        Buttons.Google,
        onPressed: () {
          context.read<AuthenticationService>().signInWithGoogle();
        },
      ),
    );
  }
}
