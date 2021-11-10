import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engineering_guide/providers/shared_preference.dart';
import 'package:engineering_guide/widgets/chip_list.dart';
import 'package:engineering_guide/widgets/dashboard_grid.dart';
import 'package:engineering_guide/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String courseName = "";
String acedemicCalender = "";
String holidayCalender = "";

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);
  static const routeName = "/dashboard";
  Future<void> data(final val) async {
    await val.sharedData();
    courseName = val.selectedCourse;
    await FirebaseFirestore.instance
        .collection("calender")
        .get()
        .then((QuerySnapshot querySnapshot) {
      acedemicCalender = querySnapshot.docs[0]["acedemicCalender"];
      holidayCalender = querySnapshot.docs[0]["holidayCalender"];
      print(acedemicCalender);
      print(holidayCalender);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<SharedPreference>(
            builder: (ctx, val, _) => FutureBuilder(
              future: data(val),
              builder: (ctx, snap) {
                return Text(courseName);
              },
            ),
          ),
        ),
        drawer: DrawerWidget(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: ChipList(courseName),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                  child: Text(
                    "Academics",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const DashboardGrid(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                  child: Text(
                    "Carrer Path",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    child: Text(
                      "First",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Second",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Third",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 400,
                child: TabBarView(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        child: Column(
                          children: const [
                            Center(
                              child: Text("First"),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        child: Column(
                          children: const [
                            Center(
                              child: Text("Second"),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        child: Column(
                          children: const [
                            Center(
                              child: Text("Third"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
