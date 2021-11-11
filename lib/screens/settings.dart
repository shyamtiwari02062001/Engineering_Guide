import 'dart:convert';

import 'package:engineering_guide/screens/dashboard.dart';
import 'package:engineering_guide/widgets/checkbox.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

int sem = 0;

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);
  static const routeName = "/settings";
  void submit(BuildContext context) {
    final data = jsonEncode({
      "isSeen": true,
      "setSelected": courseName,
      "semIndex": sem,
    });

    SharedPreferences.getInstance()
        .then((SharedPreferences pref) => pref.setString('value', data));
    Future.delayed(const Duration(seconds: 1), () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Changes applied Successfully",
            textAlign: TextAlign.center,
          ),
        ),
      );
      Navigator.of(context).pushReplacementNamed(Dashboard.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    sem = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Select the course",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Checkboxes(
              addSelected: (val) {
                courseName = val;
              },
            ),
          ),
          TextButton(
            onPressed: () => submit(context),
            child: const Text("Apply Changes"),
          ),
        ],
      ),
    );
  }
}
