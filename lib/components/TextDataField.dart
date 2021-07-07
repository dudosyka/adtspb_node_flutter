// ignore: must_be_immutable
import 'dart:developer';

import 'package:flutter/material.dart';

class TextDataField extends StatefulWidget {
  dynamic user;
  String name;
  Size size;
  dynamic onTap;
  String label;

  TextDataField({
    required this.user,
    required this.name,
    required this.size,
    required this.label,
    this.onTap,
  });

  @override
  TextDataFieldState createState() => TextDataFieldState(
      this.user, this.name, this.size, this.label, this.onTap);
}

class TextDataFieldState extends State<TextDataField> {
  TextEditingController _controller = TextEditingController();
  dynamic user;
  dynamic onTap;
  String name;
  String label;
  Size size;
  int maxLines = 1;

  TextDataFieldState(this.user, this.name, this.size, this.label, this.onTap) {
    this.unset(setMaxLines: false);
    this.maxLines = (this.user[this.name].toString().length / 31).ceil();
    log((this.user[this.name].toString().length / 31).toString());
    log(maxLines.toString());
  }

  void unset({bool setMaxLines = true}) {
    // log(this.child[this.name].toString());
    if (setMaxLines) {
      setState(() {
        this.maxLines = (this.user[this.name].toString().length / 31).round();
      });
    }
    _controller.value = TextEditingValue(text: this.user[this.name].toString());
  }

  void updateData() {
    this.user[this.name] = _controller.value.text;
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
            controller: _controller,
            onTap: this.onTap,
            maxLines: this.maxLines.toInt(),
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
