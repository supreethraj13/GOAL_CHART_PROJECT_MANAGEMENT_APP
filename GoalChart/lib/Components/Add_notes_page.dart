import 'package:flutter/material.dart';

class AddNotesPage extends StatefulWidget {
  final Function Addnote;

  AddNotesPage(this.Addnote);

  @override
  State<AddNotesPage> createState() => _AddNotesPageState();
}

class _AddNotesPageState extends State<AddNotesPage> {
  final titlecontroller = TextEditingController();
  final contentcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  // title Picker
                  TextField(
                    decoration: const InputDecoration(hintText: 'Title'),
                    controller: titlecontroller,
                  ),
                  // Content Picker
                  TextField(
                    decoration: const InputDecoration(hintText: 'Content'),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: contentcontroller,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        widget.Addnote(
                            titlecontroller.text, contentcontroller.text);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.deepPurple[400])),
                      child: const Text(
                        'Create',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
