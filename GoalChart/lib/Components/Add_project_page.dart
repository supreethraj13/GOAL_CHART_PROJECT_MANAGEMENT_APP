import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';

class AddProjectPage extends StatefulWidget {
  final Function Addtx;

  AddProjectPage(this.Addtx);

  @override
  State<AddProjectPage> createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;

  final titlecontroller = TextEditingController();
  final Descriptioncontroller = TextEditingController();
  late Color color;
  late DateTime deadline = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Project'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Personal field
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.redAccent,
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                            value: value1,
                            onChanged: (e) {
                              setState(() {
                                value1 = e!;
                              });
                            }),
                        const Icon(Icons.person),
                        const Text('Personal  ')
                      ],
                    ),
                  ),
                  // Work field
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.amber,
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                            value: value2,
                            onChanged: (e) {
                              setState(() {
                                value2 = e!;
                              });
                            }),
                        const Icon(Icons.work),
                        const Text('Work  ')
                      ],
                    ),
                  ),
                  // Group field
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blueAccent,
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                            value: value3,
                            onChanged: (e) {
                              setState(() {
                                value3 = e!;
                              });
                            }),
                        const Icon(Icons.group),
                        const Text('Group  ')
                      ],
                    ),
                  ),
                ],
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'Title'),
                controller: titlecontroller,
              ),
              TextField(
                decoration: const InputDecoration(hintText: 'Description'),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: Descriptioncontroller,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    deadline == DateTime.now()
                        ? 'Pick Date'
                        : DateFormat.yMMMd().add_jm().format(deadline),
                    style: const TextStyle(
                        fontFamily: 'CascadiaCode', fontSize: 24),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_month),
                    onPressed: () {
                      DatePicker.showDateTimePicker(
                        context,
                        minTime: DateTime.now(),
                        maxTime: DateTime(2025),
                        onChanged: (date) {
                          print('change $date');
                        },
                        onConfirm: (date) {
                          print('Confirm $date');
                        },
                      ).then((pickeddate) {
                        if (pickeddate == DateTime(2000, 01, 01)) {
                          return;
                        }
                        setState(() {
                          deadline = pickeddate!;
                        });
                      });
                    },
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    (color = value1 == true
                        ? Colors.redAccent
                        : value2 == true
                            ? Colors.yellowAccent
                            : Colors.blueAccent);
                    widget.Addtx(titlecontroller.text,
                        Descriptioncontroller.text, color, deadline);
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
      ),
    );
  }
}
