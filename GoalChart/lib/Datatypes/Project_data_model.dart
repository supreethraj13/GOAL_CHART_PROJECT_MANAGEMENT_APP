import 'package:flutter/material.dart';

class Projects {
  final String title;
  final String description;
  final String id;
  final Color color;
  bool isDone;
  final DateTime deadline;

  Projects({
    required this.title,
    required this.description,
    required this.id,
    required this.color,
    this.isDone = false,
    required this.deadline,
  });
}
