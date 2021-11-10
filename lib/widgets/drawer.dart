import 'package:engineering_guide/screens/books.dart';
import 'package:engineering_guide/screens/syllabus_list.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              color: Colors.indigo,
              child: const Center(
                child: Text(
                  "Drawer",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(SyllabusList.routeName);
              },
              leading: const Icon(Icons.description),
              title: const Text("Syllabus"),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(Books.routeName);
              },
              leading: const Icon(Icons.menu_book),
              title: const Text("Books"),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.assignment),
              title: Text("Question Papers"),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.date_range),
              title: Text("Accedemic Calender"),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.event),
              title: Text("Accedemic Calender"),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.follow_the_signs),
              title: Text("Carrer Path"),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
