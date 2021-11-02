import 'package:engineering_guide/constants/dummy_data.dart';
import 'package:flutter/material.dart';

class Checkboxes extends StatefulWidget {
  final Function addSelected;
  const Checkboxes({required this.addSelected, Key? key}) : super(key: key);

  @override
  _CheckboxesState createState() => _CheckboxesState();
}

class _CheckboxesState extends State<Checkboxes> {
  dynamic charater = subjects[0];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: subjects.length,
      itemBuilder: (ctx, index) => ListTile(
        leading: Radio(
          value: subjects[index],
          groupValue: charater,
          onChanged: (val) {
            widget.addSelected(val.toString());
            setState(
              () {
                charater = subjects[index];
              },
            );
          },
        ),
        title: Text(subjects[index]),
      ),
    );
  }
}
