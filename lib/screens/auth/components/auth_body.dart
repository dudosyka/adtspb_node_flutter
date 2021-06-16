import 'package:adtspb/screens/auth/components/auth_form.dart';
import 'package:adtspb/components/header_with_logo.dart';
import 'package:flutter/material.dart';

class AuthBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.6,
      child: Stack(
        children: <Widget>[
          HeaderWithLogo(size: size),
          AuthForm(size: size),
        ],
      ),
    );
  }
}
