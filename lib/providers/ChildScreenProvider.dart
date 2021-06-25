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
      log(true.toString());
      this._children = await userModel.getChildren();
    }
    return this._children;
  }

  void updateChild(child) {
    this._children[child['_index']] = child;
    this.uploadChild(child);
  }

  void uploadChild(child) {
    this.userModel.updateChild(child);
    this.notifyListeners();
  }
}
