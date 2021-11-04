import 'dart:convert';
import 'package:engineering_guide/constants/dummy_data.dart';
import 'package:engineering_guide/providers/shared_preference.dart';
import 'package:engineering_guide/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChipList extends StatefulWidget {
  final String courseName;
  const ChipList(this.courseName, {Key? key}) : super(key: key);

  @override
  State<ChipList> createState() => _ChipListState();
}

class _ChipListState extends State<ChipList> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 8,
      itemBuilder: (ctx, index) => Row(
        children: [
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              final pref = SharedPreferences.getInstance();
              pref.then((SharedPreferences prefs) {
                final data = jsonEncode({
                  "isSeen": true,
                  "setSelected": courseName,
                  "semIndex": index,
                });
                prefs.setString('value', data);
              });
              setState(() {
                isSelected = index;
              });
            },
            child: Consumer<SharedPreference>(
              builder: (ctx, val, _) => FutureBuilder(
                  future: val.sharedData(),
                  builder: (ctx, snap) {
                    return ChoiceChip(
                        label: Text(sem[index]),
                        selected: index == val.semesterIndex ? true : false);
                  }),
            ),
          ),
          const SizedBox(
            width: 5,
          )
        ],
      ),
    );
  }
}
