import 'dart:developer';

import 'package:adtspb/components/DateField.dart';
import 'package:adtspb/components/DropDownField.dart';
import 'package:adtspb/components/ExpandedSection.dart';
import 'package:adtspb/components/RoundedTextBtn.dart';
import 'package:adtspb/components/SnackBarNotification.dart';
import 'package:adtspb/components/TextDataField.dart';
import 'package:adtspb/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChildCard extends StatefulWidget {
  dynamic childData;
  Size size;

  ChildCard(this.childData, this.size);

  @override
  ChildCardState createState() => ChildCardState(this.childData, this.size);
}

class ChildCardState extends State<ChildCard>
    with SingleTickerProviderStateMixin {
  dynamic childData;
  Size size;
  dynamic downwardIcon = Icon(Icons.arrow_downward_outlined);
  dynamic upwardIcon = Icon(Icons.arrow_upward_outlined);
  dynamic expandedIcon;
  dynamic expanded = false;

  ChildCardState(this.childData, this.size) {
    this.expandedIcon = this.downwardIcon;
  }

  void _toggleExpanded() {
    setState(() {
      this.expanded = !this.expanded;
      this.expandedIcon = this.expanded ? this.upwardIcon : this.downwardIcon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            this._toggleExpanded();
          },
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(kDefaultPadding / 1.3),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 7,
                  color: kPrimaryColor.withOpacity(0.43),
                ),
              ],
            ),
            margin: EdgeInsets.only(
              bottom: kDefaultPadding * 0.8,
            ),
            padding: EdgeInsets.all(kDefaultPadding * 0.6),
            child: Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.child_care,
                    color: kPrimaryColor,
                  ),
                  margin: EdgeInsets.only(
                    right: kDefaultPadding * 0.8,
                  ),
                ),
                Text(
                  childData['surname'] + " " + childData['name'],
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: kDefaultPadding * 0.8,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    child: expandedIcon,
                    transitionBuilder: (child, animation) {
                      return RotationTransition(
                        child: child,
                        turns: animation,
                      );
                    },
                  ),
                  color: kPrimaryColor,
                  onPressed: () {
                    this._toggleExpanded();
                  },
                ),
              ],
            ),
          ),
        ),
        ExpandedSection(
          expand: this.expanded,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(kDefaultPadding / 1.3),
              ),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.all(kDefaultPadding),
            margin: EdgeInsets.only(
              bottom: kDefaultPadding,
            ),
            child: Column(
              children: [
                TextDataField(
                  user: this.childData,
                  group: 'main',
                  name: "surname",
                  size: this.size,
                  label: "Фамилия",
                ),
                TextDataField(
                  user: this.childData,
                  group: 'main',
                  name: "name",
                  size: this.size,
                  label: "Имя",
                ),
                TextDataField(
                  user: this.childData,
                  group: 'main',
                  name: "lastname",
                  size: this.size,
                  label: "Отчество",
                ),
                TextDataField(
                  user: this.childData,
                  group: 'main',
                  name: "phone",
                  size: this.size,
                  label: "Телефон",
                ),
                TextDataField(
                  user: this.childData,
                  group: 'main',
                  name: "email",
                  size: this.size,
                  label: "Email",
                ),
                DateField(
                  user: this.childData,
                  group: 'extra',
                  name: "birthday",
                  size: this.size,
                  label: "Дата рождения",
                ),
                TextDataField(
                  user: this.childData,
                  group: 'extra',
                  name: "state",
                  size: this.size,
                  label: "Гражданство",
                ),
                TextDataField(
                  user: this.childData,
                  group: 'extra',
                  name: "studyPlace",
                  size: this.size,
                  label: "Место обучения",
                ),
                TextDataField(
                  user: this.childData,
                  group: 'extra',
                  name: "residence_address",
                  size: this.size,
                  label: "Адрес проживания",
                ),
                TextDataField(
                  user: this.childData,
                  group: 'extra',
                  name: "registration_address",
                  size: this.size,
                  label: "Адрес регистрации",
                ),
                DropDownField(
                  user: this.childData,
                  group: 'main',
                  name: "sex",
                  size: size,
                  label: "Пол",
                  items: {"М": 1, "Ж": 0},
                ),
                Row(
                  children: [
                    RoundedTextBtn(
                      onPressed: () async {
                        await this
                            .childData["_provider"]
                            .updateChild(this.childData);
                        SnackBarNotification notify = new SnackBarNotification(
                          actionText: "Ok",
                          notificationText: "Данные успешно отправлены!",
                          context: this.context,
                          size: this.size,
                        );
                        notify.buildNotification();
                      },
                      text: "Отправить на редактирование",
                    ),
                    RoundedTextBtn(
                      onPressed: () {
                        this.childData["_provider"].deleteChild(this.childData);
                        SnackBarNotification notify = new SnackBarNotification(
                          actionText: "Ok",
                          notificationText: "Запрос на удаление отправлен!",
                          context: this.context,
                          size: this.size,
                        );
                        notify.buildNotification();
                      },
                      text: "Удалить",
                      type: RoundedTextBtnType.danger,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
