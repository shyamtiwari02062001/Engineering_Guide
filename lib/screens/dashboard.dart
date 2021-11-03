import 'package:engineering_guide/providers/shared_preference.dart';
import 'package:engineering_guide/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            builder: (ctx, snap) => Text(val.selectedCourse),
          ),
        ),
      ),
      drawer: DrawerWidget(),
    );
  }
}
