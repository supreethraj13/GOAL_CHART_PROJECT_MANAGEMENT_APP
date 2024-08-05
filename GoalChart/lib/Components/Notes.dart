import 'package:flutter/material.dart';
import 'package:GoalChart/Components/Add_notes_page.dart';
import '../Datatypes/Notes_data_model.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  List<Note> Note_list = [
    /*Note(
      id: '1',
      title: 'Note 1',
      content: 'Content of Note 1',
    ),
    Note(
      id: '2',
      title: 'Note 2',
      content: 'Content of Note 2',
    ),
    Note(
      id: '3',
      title: 'Note 3',
      content: 'Content of Note 3',
    ),*/   //was used as place holders during development
  ];

  void _ShowNewNotesTab(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddNotesPage(_AddNewNote);
        });
  }

  void _AddNewNote(String title, String content) {
    final newNote =
        Note(id: DateTime.now().toString(), title: title, content: content);
    setState(() {
      Note_list.add(newNote);
    });
    Navigator.pop(context);
  }

  void DeleteTask(String id) {
    setState(() {
      Note_list.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          ListTile(
            title: const Text(
              'Notes',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            trailing: IconButton(
              onPressed: () {
                _ShowNewNotesTab(context);
              },
              icon: const Icon(Icons.add),
            ),
          ),
          Column(
            children: Note_list.map((tx) {
              return ListTile(
                title: Text(
                  tx.title,
                  style: const TextStyle(fontSize: 30),
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tx.content,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                trailing: IconButton(
                    onPressed: () {
                      DeleteTask(tx.id);
                    },
                    icon: const Icon(Icons.delete)),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
