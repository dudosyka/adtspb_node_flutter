import 'package:adtspb/modules/Authorization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class HomeScreenBody extends StatefulWidget {
  Object? userData;

  HomeScreenBody(this.userData);

  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState(this.userData);
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final dynamic userData;

  _HomeScreenBodyState(this.userData);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'ДОБРО ПОЖАЛОВАТЬ :) \n'
                    'Рады видеть тебя, дорогой ' +
                this.userData['name'] +
                ' ' +
                this.userData['lastname'],
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {
              dynamic auth = Authorization();
              auth.logout();
              Navigator.pop(context);
              Navigator.pushNamed(context, "/login");
            },
            child: Text("Выйти"),
          )
        ],
      ),
    );
  }
}
