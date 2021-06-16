import 'package:adtspb/modules/Authorization.dart';
import 'package:adtspb/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class AuthForm extends StatelessWidget {
  final Size? size;

  AuthForm({Key? key, @required this.size}) : super(key: key);

  String? login;

  String? password;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size!.height * 0.15 + kDefaultPadding + 36,
      left: 0,
      bottom: 0,
      right: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size!.width * 0.8,
            margin: EdgeInsets.only(
              // top: size!.height * 0.15,
              bottom: 20,
            ),
            child: TextField(
              onChanged: (value) {
                this.login = value;
              },
              decoration: InputDecoration(
                hintText: "Введите номер телефона или email",
                hintStyle: TextStyle(
                  color: kTextColor.withOpacity(0.5),
                  // fontSize: 20,
                ),
                // enabledBorder: Border.lerp(1, 2 3),
                // focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Container(
            width: size!.width * 0.8,
            margin: EdgeInsets.only(
              bottom: 20,
            ),
            child: TextField(
              onChanged: (value) {
                this.password = value;
              },
              decoration: InputDecoration(
                hintText: "Пароль",
                hintStyle: TextStyle(
                  color: kTextColor.withOpacity(0.5),
                ),
                // enabledBorder: Border.lerp(1, 2 3),
                // focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Container(
            width: size!.width * 0.8,
            child: TextButton(
              onPressed: () async {
                Authorization authorization = new Authorization(
                    login: login ?? "", password: password ?? "");
                dynamic res = await authorization.auth();
                if (res) {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/home");
                }
              },
              child: Text(
                "Войти",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kPrimaryColor),
              ),
            ),
          ),
          Container(
            width: size!.width * 0.8,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 10,
                  color: kPrimaryColor.withOpacity(0.15),
                ),
              ],
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Регистрация",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 15,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
