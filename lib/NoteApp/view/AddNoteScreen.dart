import 'package:flutter/material.dart';

import 'package:app_02/NoteApp/api/NoteAPIService.dart';

import '../model/Note.dart';
import '../api/NoteAPIService.dart';
import 'NoteForm.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NoteForm(
      onSave: (Note note) async {
        try {
          await NoteAPIService.instance.createNote(note);
          Navigator.pop(context, true);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Lỗi khi thêm ghi chú: $e'),
              backgroundColor: Colors.red,
            ),
          );
          Navigator.pop(context, false);
        }
      },
    );
  }
}