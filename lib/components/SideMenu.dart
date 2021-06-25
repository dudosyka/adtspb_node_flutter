import 'dart:developer';

import 'package:adtspb/constants.dart';
import 'package:adtspb/modules/Authorization.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo_light.png"),
            decoration: BoxDecoration(color: kPrimaryColor),
          ),
          ListTile(
            title: Text('Мой профиль'),
            subtitle: Text('Управление вашими личными данными'),
            leading: Icon(
              Icons.person,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed("/home");
            },
          ),
          ListTile(
            title: Text('Мои дети'),
            subtitle: Text('Управление данными ваших детей'),
            leading: Icon(Icons.child_care),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed("/child");
            },
          ),
          ListTile(
            title: Text('Мои заявления'),
            subtitle: Text('Отслеживание статусов ваших заявлений'),
            leading: Icon(
              Icons.document_scanner,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed("/proposal");
            },
          ),
          ListTile(
            title: Text('Расписание занятий'),
            subtitle: Text('Ваше личное расписание занятий'),
            leading: Icon(
              Icons.calendar_today,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed("/timetable");
            },
          ),
          ListTile(
            title: Text('Выход'),
            subtitle: Text('Выход из аккаунта'),
            leading: Icon(
              Icons.logout,
            ),
            onTap: () {
              dynamic auth = Authorization();
              auth.logout();
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed("/login");
            },
          ),
        ],
      ),
    );
  }
}
