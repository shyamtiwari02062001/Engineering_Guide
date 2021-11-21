import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HolidayList extends StatefulWidget {
  const HolidayList({Key? key}) : super(key: key);
  static const routeName = "/holidayCalander";

  @override
  State<HolidayList> createState() => _HolidayListState();
}

class _HolidayListState extends State<HolidayList> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  List date = [];
  List event = [];
  List noOfDays = [];
  Future<void> fetchData() async {
    await FirebaseFirestore.instance
        .collection("HolidayCalander")
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var i = 0; i < querySnapshot.docs[0]["event"].length; i++) {
        date.add(querySnapshot.docs[0]['date'][i]);
        event.add(querySnapshot.docs[0]['event'][i]);
        noOfDays.add(querySnapshot.docs[0]['noOfDays'][i]);
      }
    });
    setState(() {});
  }

  @override
  void dispose() {
    date.clear();
    event.clear();
    noOfDays.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Holiday Calander"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            child: Table(
              border: TableBorder.all(),
              columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(45),
                1: FlexColumnWidth(64),
                2: FlexColumnWidth(64),
                3: FixedColumnWidth(100),
                4: FixedColumnWidth(0)
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                      child: Text(
                        "S.No",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                      child: Text(
                        "Holidays",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                      child: Text(
                        "Dates",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                      child: Text(
                        "No of Days",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 40,
                    ),
                  ],
                ),
                for (var i = 0; i < date.length; i++)
                  TableRow(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          '${i + 1}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          event[i],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          date[i],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          noOfDays[i],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(),
                    ],
                  ),
              ],
            ),
          ),
        ));
  }
}
