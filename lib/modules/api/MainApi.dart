import 'dart:developer';
import 'dart:io';

import 'dart:async';
import 'dart:convert';

import 'package:adtspb/modules/LocalStorage.dart';
import 'package:adtspb/modules/api/Api.dart';

class MainApi extends Api {
  MainApi() : super("api") {
    MyLocalStorage storage = new MyLocalStorage();
    this.token = storage.getToken()!;
  }

  Future<Map> request(String query, Object data, String name,
      [Map<String, String>? headers]) async {
    dynamic authHeader = {"Authorization": "Bearer " + this.token};
    if (headers == null) return super.request(query, data, name, authHeader);
    headers.addAll(authHeader);
    return super.request(query, data, name, headers);
  }
}
