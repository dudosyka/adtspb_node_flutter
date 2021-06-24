import 'package:adtspb/components/SideMenu.dart';
import 'package:adtspb/components/nav_bottom.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TimetableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Мое расписание"),
      ),
      drawer: SideMenu(),
      bottomNavigationBar: NavBottom(),
      body: Text("Мое расписание"),
    );
  }
}
