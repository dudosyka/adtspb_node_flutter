import 'package:adtspb/screens/auth/components/auth_form.dart';
import 'package:adtspb/screens/auth/components/header_with_logo.dart';
import 'package:flutter/material.dart';

class AuthBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithLogo(size: size),
          AuthForm(),
        ],
      ),
    );
  }
}
