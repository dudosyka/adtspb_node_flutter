import 'package:adtspb/modules/LocalStorage.dart';
import 'package:adtspb/screens/auth/components/auth_body.dart';
import 'package:adtspb/components/nav_bottom.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthScreen extends StatelessWidget {
  String? token;

  AuthScreen({Key? key, this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Image.asset("assets/images/logo_light.png"),
          onPressed: () {},
        ),
        title: Text("Авторизация"),
      ),
      body: AuthBody(),
      bottomNavigationBar: NavBottom(),
    );
  }
}
