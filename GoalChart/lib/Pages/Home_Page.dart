import 'package:flutter/material.dart';

import 'package:GoalChart/Components/Chart_View.dart';
import 'package:GoalChart/Components/Notes.dart';
import 'package:GoalChart/Components/Project_list.dart';
import 'package:GoalChart/Datatypes/Project_data_model.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final List<Projects> Project_List = [
    /*Projects(
      title: 'Project 1',
      description: 'Description 1',
      id: '1',
      color: Colors.redAccent,
      deadline: DateTime.now().add(Duration(days: 7)),
    ),
    Projects(
      title: 'Project 2',
      description: 'Description 2',
      id: '2',
      color: Colors.blueAccent,
      deadline: DateTime.now().add(Duration(days: 7)),
    ),
    Projects(
      title: 'Project 3',
      description: 'Description 3',
      id: '3',
      color: Colors.yellowAccent,
      deadline: DateTime.now().add(Duration(days: 7)),
    ),*/  //was used as place holders during development
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Goal Chart',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: ListView(
          children: [
            ChartView(Project_List),
            ProjectList(Project_List),
            Notes()
          ],
        ));
  }
}
