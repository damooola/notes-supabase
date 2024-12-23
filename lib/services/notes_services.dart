import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotesServices extends ChangeNotifier {
  final supabase = Supabase.instance.client;
  final List<Map<String, dynamic>> notesList = [];

// CREATE
  void addNewNote(String newText) async {
    await supabase.from("notes").insert({"body": newText});
    getNotes();
  }

// READ
  getNotes() {
    final notesStream = supabase.from("notes").stream(primaryKey: ["id"]);
    return notesStream;
  }

// DELETE
  void deleteNote(int id) async {
    await supabase.from("notes").delete().eq("id", id);
  }
}
