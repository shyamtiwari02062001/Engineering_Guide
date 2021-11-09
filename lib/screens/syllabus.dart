import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_guide/providers/shared_preference.dart';
import 'package:engineering_guide/screens/pdf_viewer.dart';
import 'package:engineering_guide/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List data = [];

class Syllabus extends StatefulWidget {
  const Syllabus({Key? key}) : super(key: key);
  static const routeName = "/syllabus";

  @override
  State<Syllabus> createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {
  Future<void> output(final val) async {
    await val.sharedData();
    final semester = await val.semesterIndex;
    final coursename = await val.selectedCourseData;
    await FirebaseFirestore.instance
        .collection('syllabus')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var element in querySnapshot.docs) {
        if (element["sem"] == '${semester + 1}' &&
            element["courseName"] == coursename) {
          data.add(element);
        }
      }
    });
  }

  @override
  void dispose() {
    data.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Syllabus"),
      ),
      drawer: const DrawerWidget(),
      body: Consumer<SharedPreference>(
        builder: (ctx, val, _) {
          return FutureBuilder(
            future: output(val),
            builder: (ctx, snapshot) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4 / 3,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 100,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final value = data[index].data();
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(PdfViewers.routeName,
                            arguments: value["url"]);
                      },
                      child: Card(
                        child: Center(
                          child: Text(
                            value["subject"],
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
