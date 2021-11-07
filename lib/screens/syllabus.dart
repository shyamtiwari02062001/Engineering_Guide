import 'package:engineering_guide/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Syllabus extends StatelessWidget {
  const Syllabus({Key? key}) : super(key: key);
  static const routeName = "/syllabus";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Syllabus"),
      ),
      drawer: const DrawerWidget(),
    );
  }
}
