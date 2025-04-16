import "dart:io";
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/Note.dart';
import 'EditNoteScreen.dart';

class NoteDetailScreen extends StatelessWidget {
  final Note note;

  const NoteDetailScreen({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết ghi chú'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditNoteScreen(note: note),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Ưu tiên: ${note.priority}'),
            SizedBox(height: 8),
            Text('Ngày tạo: ${DateFormat('dd/MM/yyyy HH:mm').format(note.createdAt)}'),
            SizedBox(height: 8),
            Text('Ngày sửa: ${DateFormat('dd/MM/yyyy HH:mm').format(note.modifiedAt)}'),
            SizedBox(height: 16),
            Text(note.content),
            SizedBox(height: 16),
            if (note.tags != null && note.tags!.isNotEmpty)
              Wrap(
                spacing: 8,
                children: note.tags!.map((tag) => Chip(label: Text(tag))).toList(),
              ),
          ],
        ),
      ),
    );
  }
}