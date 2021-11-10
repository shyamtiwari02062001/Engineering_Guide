import 'package:engineering_guide/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Books extends StatelessWidget {
  const Books({Key? key}) : super(key: key);
  static const routeName = "/books";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Books"),
      ),
      drawer: const DrawerWidget(),
    );
  }
}
