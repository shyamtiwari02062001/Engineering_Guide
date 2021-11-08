import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_guide/screens/pdf_viewer.dart';
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("syllabus").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data.docs;

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
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
