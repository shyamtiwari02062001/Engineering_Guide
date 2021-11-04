import 'dart:convert';

import 'package:engineering_guide/constants/dummy_data.dart';
import 'package:engineering_guide/screens/dashboard.dart';
import 'package:engineering_guide/widgets/checkbox.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];
  dynamic charater = subjects[0];
  String selectedValue = subjects[0];
  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title: "Books",
        description: "We have almost all the reference books.",
        pathImage: "images/book.gif",
        heightImage: 400,
        widthImage: 400,
        backgroundColor: const Color.fromRGBO(20, 31, 52, 1),
      ),
    );
    slides.add(
      Slide(
        title: "Path",
        description: "We got the right path which you can follow?",
        pathImage: "images/path.gif",
        heightImage: 400,
        widthImage: 400,
        backgroundColor: const Color.fromRGBO(160, 32, 240, 1),
      ),
    );
    slides.add(
      Slide(
        title: "Select Your Course",
        maxLineTitle: 2,
        styleTitle: const TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: const Color.fromRGBO(20, 31, 52, 1),
        marginDescription: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        centerWidget: Container(
          height: 340,
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 5,
            child: Checkboxes(addSelected: (val) {
              setState(() {
                selectedValue = val;
              });
            }),
          ),
        ),
      ),
    );
  }

  void onDonePress() {
    final pref = SharedPreferences.getInstance();
    pref.then((SharedPreferences prefs) {
      final data = jsonEncode({
        "isSeen": true,
        "setSelected": selectedValue,
        "semIndex": 1,
      });
      prefs.setString("value", data);
    });
    Navigator.of(context).pushReplacementNamed(Dashboard.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      // List slides
      slides: slides,
      onDonePress: onDonePress,
    );
  }
}
