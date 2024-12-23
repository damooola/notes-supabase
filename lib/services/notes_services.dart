import 'package:supabase_flutter/supabase_flutter.dart';

class NotesServices {
  final supabase = Supabase.instance.client;
  final List<Map<String, dynamic>> notesList = [];

// CREATE
  void addNewNote(String newText) async {
    final user = supabase.auth.currentUser;

    await supabase.from("notes").insert({
      "user": user!.email,
      "body": newText,
    });
    getNotes();
  }

// READ
  getNotes() {
    final notesStream = supabase.from("notes").stream(primaryKey: ["id"]);
    return notesStream;
  }

  Stream<AuthState> getAuthStream() {
    return supabase.auth.onAuthStateChange;
  }

  String? getUsersEmail() {
    final session = supabase.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }

// DELETE
  void deleteNote(int id) async {
    await supabase.from("notes").delete().eq("id", id);
  }

  // Login
  Future<void> login(String email, String password) async {
    await supabase.auth.signInWithPassword(email: email, password: password);
  }

  // SignUp
  Future<void> signUp(String email, String password) async {
    await supabase.auth.signUp(email: email, password: password);
    await supabase.from("notes").insert({"users": email});
  }

  Future<void> signOut() async {
    await supabase.auth.signOut();
  }
}
