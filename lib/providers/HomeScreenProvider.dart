import 'package:adtspb/models/user.dart';
import 'package:adtspb/modules/LocalStorage.dart';
import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  UserModel userModel = new UserModel();
  MyLocalStorage storage = new MyLocalStorage();

  Future<Object?> get viewerData async {
    return await userModel.getViewerData();
  }
}
