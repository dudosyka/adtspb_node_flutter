// ignore: must_be_immutable
import 'dart:developer';

import 'package:flutter/material.dart';

class UserDataField extends StatefulWidget {
  dynamic child;
  String name;
  Size size;
  dynamic onTap;

  UserDataField({
    required this.child,
    required this.name,
    required this.size,
    this.onTap,
  });

  @override
  UserDataFieldState createState() =>
      UserDataFieldState(this.child, this.name, this.size, this.onTap);
}

class UserDataFieldState extends State<UserDataField> {
  TextEditingController _controller = TextEditingController();
  dynamic child;
  dynamic onTap;
  String name;
  Size size;

  UserDataFieldState(this.child, this.name, this.size, this.onTap) {
    this.unset();
  }

  void unset() {
    // log(this.child[this.name].toString());
    _controller.value =
        TextEditingValue(text: this.child[this.name].toString());
  }

  void updateData() {
    this.child[this.name] = _controller.value.text;
    this.child["_provider"].updateChild(this.child);
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
            controller: _controller,
            onTap: this.onTap,
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
