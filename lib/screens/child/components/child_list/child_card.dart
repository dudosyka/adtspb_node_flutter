import 'dart:developer';

import 'package:adtspb/components/ExpandedSection.dart';
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
        Container(
          height: 70,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(kDefaultPadding / 1.3),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 7,
                color: kPrimaryColor.withOpacity(0.73),
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
                  color: Colors.white,
                ),
                margin: EdgeInsets.only(
                  right: kDefaultPadding * 0.8,
                ),
              ),
              Text(
                childData['surname'] + " " + childData['name'],
                style: TextStyle(
                  color: Colors.white,
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
                color: Colors.white,
                onPressed: () {
                  this._toggleExpanded();
                },
              ),
            ],
          ),
        ),
        ExpandedSection(
          expand: this.expanded,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(kDefaultPadding / 1.3),
              ),
            ),
            padding: EdgeInsets.all(kDefaultPadding),
            margin: EdgeInsets.only(
              bottom: kDefaultPadding,
            ),
            child: Column(
              children: [
                UserDataField(
                  child: this.childData,
                  name: "surname",
                  size: this.size,
                ),
                UserDataField(
                  child: this.childData,
                  name: "name",
                  size: this.size,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class UserDataField extends StatefulWidget {
  dynamic child;
  String name;
  Size size;

  UserDataField({
    required this.child,
    required this.name,
    required this.size,
  });

  @override
  UserDataFieldState createState() =>
      UserDataFieldState(this.child, this.name, this.size);
}

class UserDataFieldState extends State<UserDataField> {
  TextEditingController _controller = TextEditingController();
  dynamic child;
  String name;
  Size size;

  UserDataFieldState(this.child, this.name, this.size) {
    this._unset();
  }

  void _unset() {
    log(this.child[this.name]);
    _controller.value = TextEditingValue(text: this.child[this.name]);
  }

  void _updateData() {
    this.child[this.name] = _controller.value.text;
    this.child["_provider"].updateChild(this.child);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(children: [
        Expanded(
          flex: 12,
          child: TextField(
            controller: _controller,
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: _updateData,
            icon: Icon(
              Icons.done,
              color: Colors.green,
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: _unset,
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ]),
    );
  }
}
