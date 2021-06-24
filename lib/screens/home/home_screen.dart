import 'package:adtspb/components/SideMenu.dart';
import 'package:adtspb/components/nav_bottom.dart';
import 'package:adtspb/models/user.dart';
import 'package:adtspb/providers/HomeScreenProvider.dart';
import 'package:adtspb/screens/home/components/home_screen_body.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

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
        title: Text("Личный кабинет"),
      ),
      drawer: SideMenu(),
      bottomNavigationBar: NavBottom(),
      body: ChangeNotifierProvider<HomeScreenProvider>(
        create: (context) => HomeScreenProvider(),
        child: HomeScreenBody(),
      ),
    );
  }
}
