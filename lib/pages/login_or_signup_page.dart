import 'package:flutter/material.dart';
import 'package:notes_supabase/pages/log_in_page.dart';
import 'package:notes_supabase/pages/sign_up_page.dart';

class LoginOrSignupPage extends StatefulWidget {
  const LoginOrSignupPage({super.key});

  @override
  State<LoginOrSignupPage> createState() => _LoginOrSignupPageState();
}

class _LoginOrSignupPageState extends State<LoginOrSignupPage> {
  bool isPageLogin = true;
  void switchPage() {
    setState(() {
      isPageLogin = !isPageLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isPageLogin
        ? LoginPage(goToSignUpPage: switchPage)
        : SignUpPage(
            goToLoginPage: switchPage,
          );
  }
}
