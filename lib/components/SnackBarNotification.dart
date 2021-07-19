import 'package:adtspb/constants.dart';
import 'package:flutter/material.dart';

class SnackBarNotification {
  late Size? size;
  String actionText;
  String notificationText;
  BuildContext context;

  SnackBarNotification({
    required this.actionText,
    required this.notificationText,
    required this.context,
    this.size,
  });

  void buildNotification() {
    if (this.size == null) {
      this.size = MediaQuery.of(context).size;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          textColor: Colors.white,
          label: actionText,
          onPressed: () {},
        ),
        duration: Duration(seconds: 3),
        backgroundColor: kPrimaryColor,
        width: size!.width * 0.7,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        content: Text(
          notificationText,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
