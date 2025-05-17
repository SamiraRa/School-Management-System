import 'package:flutter/material.dart';

class ClassesScheduleScreen extends StatefulWidget {
  const ClassesScheduleScreen({super.key});

  @override
  State<ClassesScheduleScreen> createState() => _ClassesScheduleScreenState();
}

class _ClassesScheduleScreenState extends State<ClassesScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class Schedule'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
