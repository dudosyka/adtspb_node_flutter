// ignore: must_be_immutable
import 'dart:developer';

import 'package:flutter/material.dart';

class DropDownField extends StatefulWidget {
  dynamic user;
  String group;
  String name;
  Size size;
  dynamic onTap;
  Map<String, int> items;
  String label;

  DropDownField({
    required this.user,
    required this.group,
    required this.name,
    required this.size,
    required this.label,
    required this.items,
    this.onTap,
  });

  @override
  DropDownFieldState createState() => DropDownFieldState(this.user, this.group,
      this.name, this.size, this.label, this.onTap, this.items);
}

class DropDownFieldState extends State<DropDownField> {
  dynamic user;
  String group;
  String name;
  String label;
  Map<String, int> items;
  Size size;
  int? value;
  dynamic onTap;

  DropDownFieldState(this.user, this.group, this.name, this.size, this.label,
      this.onTap, this.items) {
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
    this.setEditData(false);
  }

  void setEditData(value) {
    this.user['dataOnEdit'][this.group][this.name] = value;
  }

  void updateData(int? value) {
    if (this.user['clearData'][this.name] == value) {
      this.setEditData(false);
    } else {
      this.setEditData(value);
    }

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
