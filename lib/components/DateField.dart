import 'dart:developer';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DateField extends StatefulWidget {
  dynamic user;
  String group;
  String name;
  String label;
  Size size;
  dynamic onTap;

  DateField({
    required this.user,
    required this.group,
    required this.name,
    required this.size,
    required this.label,
    this.onTap,
  });

  DateTime firstDate = DateTime(2000, 01, 01);
  DateTime lastDate = DateTime.now();

  DateFieldState createState() => DateFieldState(
      this.user,
      this.group,
      this.name,
      this.label,
      this.size,
      this.onTap,
      this.firstDate,
      this.lastDate);
}

class DateFieldState extends State<DateField> {
  TextEditingController _controller = TextEditingController();
  dynamic user;
  String group;
  String name;
  String label;
  Size size;
  DateTime firstDate;
  DateTime lastDate;
  DateTime selectedDate = DateTime.now();
  dynamic onTap;

  DateFieldState(this.user, this.group, this.name, this.label, this.size,
      this.onTap, this.firstDate, this.lastDate) {
    this.firstDate = this.timestampToDateTime();
    this.selectedDate = this.timestampToDateTime();
    this.unset();
  }

  String buildDateFromDateTime(DateTime dateTime) {
    String year = dateTime.year.toString();
    String month = dateTime.month.toString();
    String day = dateTime.day.toString();
    log(year + "-" + month + "-" + day);
    return year + "-" + month + "-" + day;
  }

  DateTime timestampToDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(
        int.parse(this.user[this.name].toString()));
  }

  void setControllerValue(String value) {
    _controller.value = TextEditingValue(
      text: value,
    );
  }

  void unset() {
    log(this.user[this.name].toString());
    log(
      this.buildDateFromDateTime(
        DateTime.fromMillisecondsSinceEpoch(
          int.parse(this.user[this.name].toString()),
        ),
      ),
    );
    this.setControllerValue(
      this.buildDateFromDateTime(
        DateTime.fromMillisecondsSinceEpoch(
          int.parse(this.user[this.name].toString()),
        ),
      ),
    );
  }

  DateTime dateTimeFromString(string) {
    dynamic exploded = string.split("-");
    int year = int.parse(exploded[0].toString());
    int month = int.parse(exploded[1].toString());
    int day = int.parse(exploded[2].toString());
    return DateTime(year, month, day);
  }

  void setEditData(value) {
    this.user['dataOnEdit'][this.group][this.name] = value;
  }

  void updateData() {
    DateTime dateTime =
        this.dateTimeFromString(this._controller.value.text.toString());
    dynamic value = dateTime.millisecondsSinceEpoch.toString();
    if (this.user['clearData'][this.name] == value) {
      this.setEditData(false);
    } else {
      this.setEditData(value);
    }
    this.user[this.name] = value;
  }

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: this.firstDate,
      lastDate: this.lastDate,
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        this.setControllerValue(this.buildDateFromDateTime(selectedDate));
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(children: [
        Expanded(
          flex: 12,
          child: TextField(
            decoration: InputDecoration(
              labelText: this.label,
            ),
            readOnly: true,
            controller: _controller,
            onTap: _selectDate,
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: updateData,
            icon: Icon(
              Icons.done,
              color: Colors.green,
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: unset,
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ]),
    );
  }
}
