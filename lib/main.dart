import 'package:engineering_guide/screens/books.dart';
import 'package:engineering_guide/screens/dashboard.dart';
import 'package:engineering_guide/screens/holiday_list.dart';
import 'package:engineering_guide/screens/intro_screen.dart';
import 'package:engineering_guide/screens/pdf_viewer.dart';
import 'package:engineering_guide/screens/settings.dart';
import 'package:engineering_guide/screens/syllabus.dart';
import 'package:engineering_guide/screens/syllabus_list.dart';
import '/providers/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: SharedPreference(),
        ),
      ],
      child: Consumer<SharedPreference>(
        builder: (ctx, val, _) => MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.indigo,
            ).copyWith(secondary: Colors.lightGreenAccent),
          ),
          home: FutureBuilder(
            future: val.sharedData(),
            builder: (ctx, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? const Center(
                        child: Text("loading...."),
                      )
                    : val.isSeenScreen
                        ? const Dashboard()
                        : const IntroScreen(),
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            Dashboard.routeName: (ctx) => const Dashboard(),
            SyllabusList.routeName: (ctx) => const SyllabusList(),
            Syllabus.routeName: (ctx) => const Syllabus(),
            Books.routeName: (ctx) => const Books(),
            HolidayList.routeName: (ctx) => const HolidayList(),
            Setting.routeName: (ctx) => const Setting(),
            PdfViewers.routeName: (ctx) => const PdfViewers()
          },
        ),
      ),
    );
  }
}
