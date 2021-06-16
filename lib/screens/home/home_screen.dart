import 'package:adtspb/constants.dart';
import 'package:adtspb/modules/Authorization.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text(
                'ДОБРО ПОЖАЛОВАТЬ :)',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 26,
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
                  child: Text("Выйти"))
            ],
          )),
    );
  }
}
