import 'package:adtspb/components/SideMenu.dart';
import 'package:adtspb/components/nav_bottom.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProposalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Мои заявления"),
      ),
      drawer: SideMenu(),
      bottomNavigationBar: NavBottom(),
      body: Text("Мои заявления"),
    );
  }
}
