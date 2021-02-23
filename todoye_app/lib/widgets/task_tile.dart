import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      {@required this.text,
      this.isChecked,
      this.checkboxCallback,
      this.longPressCallback});
  final String text;
  final bool isChecked;
  final Function checkboxCallback;
  final Function longPressCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      onLongPress: longPressCallback,
    );
  }
}
