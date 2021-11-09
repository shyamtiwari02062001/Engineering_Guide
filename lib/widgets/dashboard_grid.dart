import 'package:engineering_guide/screens/syllabus_list.dart';
import 'package:flutter/material.dart';

class DashboardGrid extends StatelessWidget {
  const DashboardGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(SyllabusList.routeName),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.description,
                            size: 80,
                            color: Color(0xFFFFD54F),
                          ),
                          Text(
                            "Syllabus",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFFD54F)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.menu_book,
                          size: 80,
                          color: Color(0xFFEF5350),
                        ),
                        Text(
                          "Books",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFEF5350)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.29,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.assignment,
                          size: 60,
                          color: Color(0xFF66BB6A),
                        ),
                        Text(
                          "Prev Papers",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF66BB6A)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.29,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.date_range,
                          size: 60,
                          color: Color(0xFF66BBFA),
                        ),
                        Text(
                          "Calender",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF66BBFA)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.29,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.event,
                          size: 60,
                          color: Color(0xFFAB47BC),
                        ),
                        Text(
                          "Holiday List",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFAB47BC)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
