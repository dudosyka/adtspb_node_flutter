import 'package:flutter/material.dart';

import '../constants.dart';

class HeaderWithLogo extends StatelessWidget {
  final Size? size;

  HeaderWithLogo({Key? key, @required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding + 10,
        right: kDefaultPadding,
        bottom: kDefaultPadding,
        top: kDefaultPadding,
      ),
      height: size!.height * 0.18 - 27,
      width: size!.width,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 15),
            blurRadius: 15,
            color: kPrimaryColor.withOpacity(0.53),
          ),
        ],
      ),
      child: Container(
        width: size!.width * 0.6,
        margin: EdgeInsets.all(0),
        child: Text(
          'Добро пожаловать в личный кабинет',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}
