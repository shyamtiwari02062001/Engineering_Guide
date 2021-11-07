import 'package:cloud_firestore/cloud_firestore.dart';
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
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (ctx, index) {
                final value = data[index].data();
                if (index % 2 == 0) {
                  return ListTile(
                    leading: Text(value['sem']),
                    title: Text(value['courseName']),
                    trailing: Text(value["subject"]),
                  );
                } else {
                  return ListTile(
                    leading: Text(value['sem']),
                    title: Text(value['courseName']),
                    trailing: Text(value["subject"]),
                  );
                }
              },
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
