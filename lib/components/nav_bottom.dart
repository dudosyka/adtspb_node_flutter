import 'package:adtspb/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.all(kDefaultPadding - 10),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        "(c)ADT 2021",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
