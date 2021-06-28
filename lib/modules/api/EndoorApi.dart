import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:adtspb/modules/LocalStorage.dart';
import 'package:adtspb/modules/api/Api.dart';

class EndoorApi extends Api {
  EndoorApi() : super("endoor") {
    MyLocalStorage storage = new MyLocalStorage();
  }
}
