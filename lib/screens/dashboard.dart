import 'package:engineering_guide/providers/shared_preference.dart';
import 'package:engineering_guide/widgets/chip_list.dart';
import 'package:engineering_guide/widgets/dashboard_grid.dart';
import 'package:engineering_guide/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String courseName = "";

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);
  static const routeName = "/dashboard";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<SharedPreference>(
          builder: (ctx, val, _) => FutureBuilder(
            future: val.sharedData(),
            builder: (ctx, snap) {
              courseName = val.selectedCourse;
              return Text(val.selectedCourse);
            },
          ),
        ),
      ),
      drawer: const DrawerWidget(),
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
            const DefaultTabController(
                length: 3,
                child: TabBar(
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(
                        child: Text(
                      "Gate",
                    )),
                    Tab(
                        child: Text(
                      "Gate",
                    )),
                    Tab(
                        child: Text(
                      "Gate",
                    )),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
