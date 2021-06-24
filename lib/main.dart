import 'dart:developer';

import 'package:adtspb/modules/LocalStorage.dart';
import 'package:adtspb/screens/auth/auth_screen.dart';
import 'package:adtspb/screens/child/child_screen.dart';
import 'package:adtspb/screens/home/home_screen.dart';
import 'package:adtspb/screens/proposal/proposal_screen.dart';
import 'package:adtspb/screens/timetable/timetable_screen.dart';
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
              if (storage.token != null) return HomeScreen();
            }
            return AuthScreen();
          },
        ),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => HomeScreen(),
          '/login': (BuildContextcontext) => AuthScreen(),
          '/child': (BuildContext context) => ChildScreen(),
          '/proposal': (BuildContext context) => ProposalScreen(),
          '/timetable': (BuildContext context) => TimetableScreen(),
        });
  }
}
