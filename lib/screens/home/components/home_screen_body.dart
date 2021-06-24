import 'dart:developer';

import 'package:adtspb/components/Loader.dart';
import 'package:adtspb/modules/Authorization.dart';
import 'package:adtspb/providers/HomeScreenProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class HomeScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, value, child) {
        return FutureBuilder(
          future: value.viewerData,
          builder: (context, snapshot) {
            dynamic userData = snapshot.data;
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Добро пожаловать, " + userData['name']),
                  ],
                ),
              );
            } else {
              return Loader(Colors.black);
            }
          },
        );
      },
    );
  }
}
