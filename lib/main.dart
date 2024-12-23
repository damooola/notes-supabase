import 'package:flutter/material.dart';
import 'package:notes_supabase/pages/auth_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  const supabaseUrl = 'https://vfkqhxpsshtvnonpfxli.supabase.co';

  // supabase set up
  WidgetsFlutterBinding.ensureInitialized();

// initialise supabase
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZma3FoeHBzc2h0dm5vbnBmeGxpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ5NDIxMjYsImV4cCI6MjA1MDUxODEyNn0._Yba6hSh1BeoMZY2GE6-FIsyU19_sTCqE9U-Yn6UOMs",
  );
  // run app
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
