import 'package:flutter/material.dart';
import 'package:notes_supabase/pages/login_or_signup_page.dart';
import 'package:notes_supabase/pages/notes_page.dart';

import '../services/notes_services.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});
  final notesServices = NotesServices();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: notesServices.getAuthStream(),
      builder: (context, snapshot) {
        final session = snapshot.hasData ? snapshot.data!.session : null;
        if (session != null) {
          return const NotesPage();
        } else {
          return const LoginOrSignupPage();
        }
      },
    );
  }
}
