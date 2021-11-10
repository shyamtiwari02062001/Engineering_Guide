import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_guide/providers/shared_preference.dart';
import 'package:engineering_guide/screens/syllabus.dart';
import 'package:engineering_guide/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List data = [];

class SyllabusList extends StatefulWidget {
  const SyllabusList({Key? key}) : super(key: key);
  static const routeName = "/syllabusList";

  @override
  State<SyllabusList> createState() => _SyllabusListState();
}

bool isDone = false;

class _SyllabusListState extends State<SyllabusList> {
  Future<void> output(final val) async {
    await val.sharedData();
    final semester = await val.semesterIndex;
    final coursename = await val.selectedCourseData;
    await FirebaseFirestore.instance
        .collection('syllabus')
        .orderBy("time")
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var element in querySnapshot.docs) {
        if (element["sem"] == '${semester + 1}' &&
            element["courseName"] == coursename &&
            isDone == false) {
          data.add(element);
        }
      }
      isDone = true;
    });
  }

  @override
  void dispose() {
    data = [];
    isDone = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Syllabus"),
      ),
      drawer: DrawerWidget(),
      body: Consumer<SharedPreference>(
        builder: (ctx, val, _) {
          return FutureBuilder(
            future: output(val),
            builder: (ctx, snapshot) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  itemCount: data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 2
                        : 3,
                    childAspectRatio: 3 / 4,
                    mainAxisExtent: 150,
                  ),
                  itemBuilder: (context, index) {
                    final value = data[index].data();
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(Syllabus.routeName,
                              arguments: data[index].data());
                        },
                        child: Card(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                value["subject"],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
