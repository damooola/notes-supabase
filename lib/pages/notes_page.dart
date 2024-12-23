import 'package:flutter/material.dart';
import 'package:notes_supabase/services/notes_services.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final TextEditingController addNoteController = TextEditingController();
  final notesServices = NotesServices();
  addNewNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add New Note"),
        content: TextFormField(
          controller: addNoteController,
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel")),
          ElevatedButton(
              onPressed: () {
                notesServices.addNewNote(addNoteController.text);
                addNoteController.clear();
                Navigator.pop(context);
              },
              child: const Text("Add"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: notesServices.signOut, icon: const Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: notesServices.getNotes(),
        builder: (context, snapshot) {
          // loading
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          //all notes
          final notesList = snapshot.data!;
          return ListView.builder(
            itemCount: notesList.length,
            itemBuilder: (context, index) {
              final note = notesList[index];
              return Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.grey,
                ),
                child: ListTile(
                  leading: Text(note["id"].toString()),
                  title: Text(note["body"]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: addNewNote, child: const Icon(Icons.add)),
    );
  }
}
