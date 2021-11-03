import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            color: Colors.amber,
            child: const Center(
              child: Text("Drawer"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text("Syllabus"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.menu_book),
            title: Text("Books"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text("Question Papers"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.date_range),
            title: Text("Accedemic Calender"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.event),
            title: Text("Holiday List"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.follow_the_signs),
            title: Text("Carrer Path"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
          Divider(),
        ],
      ),
    );
  }
}
