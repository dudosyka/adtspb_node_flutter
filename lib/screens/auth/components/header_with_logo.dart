import 'package:adtspb/constants.dart';
import 'package:flutter/material.dart';

class HeaderWithLogo extends StatelessWidget {
  const HeaderWithLogo({
    Key? key,
    @required this.size,
  }) : super(key: key);

  final Size? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size!.height * 0.80,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding + 10,
              right: kDefaultPadding,
              bottom: kDefaultPadding,
              top: kDefaultPadding,
            ),
            height: size!.height * 0.18 - 27,
            width: size!.width,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 15),
                  blurRadius: 15,
                  color: kPrimaryColor.withOpacity(0.53),
                ),
              ],
            ),
            child: Container(
              width: size!.width * 0.6,
              margin: EdgeInsets.all(0),
              child: Text(
                'Добро пожаловать в личный кабинет',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
            ),
          ),
          Positioned(
            top: kDefaultPadding + 36,
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
                    onChanged: (value) {},
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
                    onChanged: (value) {},
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
                    onPressed: () {},
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
          ),
        ],
      ),
    );
  }
}
