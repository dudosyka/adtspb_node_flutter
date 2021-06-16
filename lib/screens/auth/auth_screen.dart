import 'package:adtspb/screens/auth/components/auth_body.dart';
import 'package:adtspb/components/nav_bottom.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Image.asset("assets/images/logo_light.png"),
          onPressed: () {},
        ),
      ),
      body: AuthBody(),
      bottomNavigationBar: NavBottom(),
    );
  }
}
