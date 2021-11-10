import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_guide/providers/shared_preference.dart';
import 'package:engineering_guide/screens/pdf_viewer.dart';
import 'package:engineering_guide/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Books extends StatefulWidget {
  const Books({Key? key}) : super(key: key);
  static const routeName = "/books";

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  late String course;

  late int sem;

  final List data = [];
  bool isDone = false;
  Future<void> output(SharedPreference val) async {
    await val.sharedData();
    course = val.selectedCourse;
    sem = val.semIndex;
    await FirebaseFirestore.instance
        .collection("books")
        .get()
        .then((QuerySnapshot querySnapshot) => {
              // ignore: avoid_function_literals_in_foreach_calls
              querySnapshot.docs.forEach((element) {
                if (element["courseName"] == course &&
                    element["sem"] == '${sem + 1}' &&
                    isDone == false) {
                  data.add(element);
                }
              }),
              isDone = true
            });
  }

  @override
  void dispose() {
    isDone = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Books"),
        ),
        drawer: const DrawerWidget(),
        body: Consumer<SharedPreference>(
          builder: (ctx, val, _) {
            return FutureBuilder(
                future: output(val),
                builder: (ctx, snap) {
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (ctx, index) {
                        return ListTile(
                          title: Text(
                            data[index]["subject"],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Container(
                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              height: MediaQuery.of(context).size.height,
                              child: GridView.builder(
                                  itemCount: data[index]["bookName"].length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: MediaQuery.of(context)
                                                      .orientation ==
                                                  Orientation.landscape
                                              ? 3
                                              : 2,
                                          crossAxisSpacing: 10,
                                          mainAxisExtent: 200,
                                          childAspectRatio: 2 / 4,
                                          mainAxisSpacing: 10),
                                  itemBuilder: (ctx, i) {
                                    return GestureDetector(
                                      onTap: () =>
                                          Navigator.of(context).pushNamed(
                                        PdfViewers.routeName,
                                        arguments: {
                                          "BookName": data[index]["bookName"]
                                              [i],
                                          "pdfUrl": data[index]["fileUrl"][i]
                                        },
                                      ),
                                      child: Card(
                                        child: Center(
                                          child: Image.network(
                                            data[index]["imageLink"][i],
                                            height: 170,
                                          ),
                                        ),
                                      ),
                                    );
                                  })),
                        );
                      });
                });
          },
        ));
  }
}
