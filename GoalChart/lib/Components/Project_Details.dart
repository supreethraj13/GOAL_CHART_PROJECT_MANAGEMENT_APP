import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:GoalChart/Datatypes/Project_data_model.dart';


class ProjectDetails extends StatefulWidget {
  final Projects tx;
  final Function Delete;

  const ProjectDetails(this.tx, this.Delete, {super.key});

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // button to delete the project.
          IconButton(
              onPressed: () {
                widget.Delete(widget.tx.id);
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            // title
            Text(
              widget.tx.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 75),
            ),
            Container(
              height: 10,
            ),

            //Description
            Text(
              widget.tx.description,
              style: const TextStyle(fontSize: 18),
            ),
            Container(
              height: 10,
            ),

            // Due and Progress button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Due',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            widget.tx.isDone == false
                                ? Colors.greenAccent
                                : Colors.blueAccent)),
                    child: Text(
                      widget.tx.isDone == false ? 'In Progress' : 'Completed',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ))
              ],
            ),
            Container(
              height: 10,
            ),

            // Display Due Date
            Text(
              DateFormat.yMMMMd().add_jm().format(widget.tx.deadline),
              style: const TextStyle(fontSize: 30),
            ),
            Container(
              height: 40,
            ),

            // Mark as Complete Button
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.tx.isDone = !widget.tx.isDone;
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.deepPurple[400])),
                  child: Text(
                    widget.tx.isDone == false
                        ? 'Mark as Complete'
                        : 'Mark as In Progress',
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
