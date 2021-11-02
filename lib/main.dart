import 'package:engineering_guide/screens/dashboard.dart';
import 'package:engineering_guide/screens/intro_screen.dart';

import '/providers/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber)
                .copyWith(secondary: Colors.lightGreenAccent),
          ),
          home: FutureBuilder(
            future: val.sharedData(),
            builder: (ctx, snapshot) =>
                val.isSeenScreen ? const Dashboard() : const IntroScreen(),
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            Dashboard.routeName: (ctx) => const Dashboard(),
          },
        ),
      ),
    );
  }
}
