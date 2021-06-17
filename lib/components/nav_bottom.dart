import 'dart:developer';

import 'package:adtspb/constants.dart';
import 'package:adtspb/modules/LocalStorage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBottom extends StatefulWidget {
  String? token;

  NavBottom({Key? key, this.token}) : super(key: key);

  @override
  NavBottomState createState() => NavBottomState(this.token);
}

class NavBottomState extends State<NavBottom> {
  String? token;

  NavBottomState(this.token);

  void getToken() {
    MyLocalStorage storage = new MyLocalStorage();
    this.setState(() {
      this.token = storage.token ?? "TOKEN NOT FOUNDed";
      log(this.token.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: EdgeInsets.all(kDefaultPadding - 10),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            this.token ?? 'NULL',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          TextButton(
            child: Text("GET TOKEN"),
            onPressed: this.getToken,
          )
        ],
      ),
    );
  }
}
