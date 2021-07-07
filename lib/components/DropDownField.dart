// ignore: must_be_immutable
import 'dart:developer';

import 'package:flutter/material.dart';

class DropDownField extends StatefulWidget {
  dynamic user;
  String name;
  Size size;
  dynamic onTap;
  Map<String, int> items;
  String label;

  DropDownField({
    required this.user,
    required this.name,
    required this.size,
    required this.label,
    required this.items,
    this.onTap,
  });

  @override
  DropDownFieldState createState() => DropDownFieldState(
      this.user, this.name, this.size, this.label, this.onTap, this.items);
}

class DropDownFieldState extends State<DropDownField> {
  dynamic user;
  dynamic onTap;
  String name;
  String label;
  Map<String, int> items;
  Size size;
  int? value;

  DropDownFieldState(
      this.user, this.name, this.size, this.label, this.onTap, this.items) {
    this.unset();
  }

  List<DropdownMenuItem<int>> dropdownItems() {
    List<DropdownMenuItem<int>> itemsList = [];
    this.items.forEach((String key, int value) {
      log(value.toString());
      log(key);
      itemsList.add(DropdownMenuItem<int>(
        value: value,
        child: Text(key),
      ));
    });
    log(itemsList.toString());
    return itemsList;
  }

  void unset() {
    this.value = int.parse(this.user[this.name].toString());
  }

  void updateData(int? value) {
    setState(() {
      this.value = value;
      this.user[this.name] = this.value;
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
            child: DropdownButton(
              value: this.value,
              items: this.dropdownItems(),
              onChanged: (int? value) {
                this.updateData(value);
              },
            )),
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
