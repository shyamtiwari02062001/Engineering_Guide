import 'package:engineering_guide/providers/shared_preference.dart';
import 'package:engineering_guide/screens/books.dart';
import 'package:engineering_guide/screens/holiday_list.dart';
import 'package:engineering_guide/screens/settings.dart';
import 'package:engineering_guide/screens/syllabus_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/dashboard.dart';
import "../screens/settings.dart";

// ignore: must_be_immutable
class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key? key}) : super(key: key);
  String courseName = "";
  String acedemicCalanderUrl = "";
  String holidayCalanderUrl = "";
  int sem = 0;
  Future<void> data(final val) async {
    await val.sharedData();
    courseName = val.selectedCourse;
    sem = val.semIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SharedPreference>(
      builder: (ctx, val, _) {
        return FutureBuilder(
            future: data(val),
            builder: (ctx, snap) {
              return Drawer(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        color: Colors.teal,
                        child: Center(
                          child: Text(
                            courseName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(Dashboard.routeName);
                        },
                        leading: const Icon(Icons.home),
                        title: const Text("Home"),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context)
                              .pushReplacementNamed(SyllabusList.routeName);
                        },
                        leading: const Icon(Icons.description),
                        title: const Text("Syllabus"),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context)
                              .pushReplacementNamed(Books.routeName);
                        },
                        leading: const Icon(Icons.menu_book),
                        title: const Text("Books"),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context)
                              .pushReplacementNamed(Books.routeName);
                        },
                        leading: const Icon(Icons.notes),
                        title: const Text("Notes"),
                      ),
                      const Divider(),
                      const ListTile(
                        leading: Icon(Icons.assignment),
                        title: Text("Question Papers"),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context)
                              .pushNamed(HolidayList.routeName);
                        },
                        leading: const Icon(Icons.event),
                        title: const Text("Holiday Calender"),
                      ),
                      const Divider(),
                      const ListTile(
                        leading: Icon(Icons.follow_the_signs),
                        title: Text("Carrer Path"),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () => Navigator.of(context).pushReplacementNamed(
                            Setting.routeName,
                            arguments: sem.toInt()),
                        leading: const Icon(Icons.settings),
                        title: const Text("Settings"),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
