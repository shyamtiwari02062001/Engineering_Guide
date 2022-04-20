import 'package:flutter/material.dart';

class Syllabus extends StatelessWidget {
  const Syllabus({Key? key}) : super(key: key);
  static const routeName = "/syllabus";
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(data["subject"]),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: ListView.builder(
          itemCount: data["moduleName"].length,
          itemBuilder: (ctx, index) => ListTile(
            title: Text(
              data["moduleName"][index].toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            contentPadding: const EdgeInsets.all(5),
            horizontalTitleGap: 10,
            subtitle: Text(
              data["topics"][index],
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
