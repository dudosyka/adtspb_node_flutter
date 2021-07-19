import 'package:flutter/material.dart';

import '../constants.dart';

enum RoundedTextBtnType {
  danger,
  normal,
}

class RoundedTextBtn extends StatelessWidget {
  dynamic onPressed;
  String text;
  RoundedTextBtnType type;
  late Color backColor;
  late Color textColor;
  late Color shadowColor;

  RoundedTextBtn({
    required this.onPressed,
    required this.text,
    this.type = RoundedTextBtnType.normal,
  }) {
    if (this.type == RoundedTextBtnType.normal) {
      this.backColor = kPrimaryColor;
      this.textColor = Colors.white;
      this.shadowColor = kPrimaryColor;
    } else if (this.type == RoundedTextBtnType.danger) {
      this.backColor = Colors.white70;
      this.textColor = Colors.red;
      this.shadowColor = Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: this.onPressed,
      child: Container(
        margin: EdgeInsets.only(
          top: kDefaultPadding * 0.5,
        ),
        padding: EdgeInsets.all(kDefaultPadding * 0.5),
        decoration: BoxDecoration(
            color: this.backColor,
            borderRadius: BorderRadius.all(
              Radius.circular(kDefaultPadding),
            ),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                offset: Offset(0, 0),
                blurRadius: 10,
              ),
            ]),
        child: Text(
          this.text,
          style: TextStyle(
            color: this.textColor,
          ),
        ),
      ),
    );
  }
}
