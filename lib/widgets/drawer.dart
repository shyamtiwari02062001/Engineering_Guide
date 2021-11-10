import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_guide/providers/shared_preference.dart';
import 'package:engineering_guide/screens/books.dart';
import 'package:engineering_guide/screens/pdf_viewer.dart';
import 'package:engineering_guide/screens/syllabus_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key? key}) : super(key: key);
  String courseName = "";
  String acedemicCalanderUrl = "";
  String holidayCalanderUrl = "";
  Future<void> data(final val) async {
    await val.sharedData();
    courseName = val.selectedCourse;
    await FirebaseFirestore.instance
        .collection("calender")
        .get()
        .then((QuerySnapshot querySnapshot) {
      acedemicCalanderUrl = querySnapshot.docs[0]["acedemicCalender"];
      holidayCalanderUrl = querySnapshot.docs[0]["holidayCalender"];
    });
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
                        color: Colors.indigo,
                        child: Center(
                          child: Text(
                            courseName,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context)
                              .pushNamed(SyllabusList.routeName);
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
                      ListTile(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context)
                              .pushNamed(PdfViewers.routeName, arguments: {
                            "BookName": "Acedemic Calender",
                            "pdfUrl": acedemicCalanderUrl,
                          });
                        },
                        leading: const Icon(Icons.date_range),
                        title: const Text("Accedemic Calender"),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context)
                              .pushNamed(PdfViewers.routeName, arguments: {
                            "BookName": "Holiday Calender",
                            "pdfUrl": holidayCalanderUrl,
                          });
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
                      const ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Settings"),
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
