import 'dart:developer';

import 'package:adtspb/models/user.dart';
import 'package:adtspb/modules/LocalStorage.dart';
import 'package:flutter/material.dart';

class ChildScreenProvider extends ChangeNotifier {
  UserModel userModel = new UserModel();
  MyLocalStorage storage = new MyLocalStorage();

  dynamic _children = [];

  Future<Object?> get children async {
    if (_children.length == 0) {
      this._children = await userModel.getChildren();
    }
    return this._children;
  }

  void updateChild(child) {
    log(child.toString());
    this._children[child['_index']] = child;
    this.uploadChild(child);
  }

  void uploadChild(child) {
    log(child['dataOnEdit']['main'].length.toString());
    log(child['dataOnEdit']['extra'].length.toString());
    if (child['dataOnEdit']['main'].length > 1)
      this.userModel.updateMainData(child['dataOnEdit']['main']);
    if (child['dataOnEdit']['extra'].length > 1)
      this.userModel.updateExtraData(child['dataOnEdit']['extra']);
  }

  void deleteChild(child) {
    this.userModel.deleteChild(id: child['id']);
  }
}
