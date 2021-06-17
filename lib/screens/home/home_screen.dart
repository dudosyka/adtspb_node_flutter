import 'package:adtspb/components/nav_bottom.dart';
import 'package:adtspb/constants.dart';
import 'package:adtspb/models/user.dart';
import 'package:adtspb/modules/Authorization.dart';
import 'package:adtspb/modules/api/Api.dart';
import 'package:adtspb/modules/api/MainApi.dart';
import 'package:adtspb/screens/home/components/home_screen_body.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  String? token;

  HomeScreen({Key? key, this.token}) : super(key: key);

  UserModel user = new UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Image.asset("assets/images/logo_light.png"),
          onPressed: () {},
        ),
        title: Text("Личный кабинет"),
      ),
      bottomNavigationBar: NavBottom(),
      body: FutureBuilder(
        future: user.getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return HomeScreenBody(snapshot.data);
          }
          // log(snapshot.toString());
          return Container(
            alignment: Alignment.center,
            child: Text(
              "Добро пожаловать! :)",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
