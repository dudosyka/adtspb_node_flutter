import 'dart:developer';

import 'package:adtspb/modules/LocalStorage.dart';
import 'package:adtspb/screens/auth/auth_screen.dart';
import 'package:adtspb/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MyLocalStorage storage = new MyLocalStorage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ADT.LK',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          scaffoldBackgroundColor: kBackgroundColor,
        ),
        home: FutureBuilder(
          future: this.storage.storage.ready,
          builder: (context, snapshot) {
            if (snapshot.data == true) {
              log(storage.token ?? "TOKEN NULL");
              if (storage.token != null) return HomeScreen();
            }
            return AuthScreen();
          },
        ),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => HomeScreen(),
          '/login': (BuildContext context) => AuthScreen()
        });
  }
}

Widget checkAuthorization() {
  MyLocalStorage storage = new MyLocalStorage();
  log(storage.token ?? "");
  if (storage.token == null) return AuthScreen();
  return HomeScreen();
}
