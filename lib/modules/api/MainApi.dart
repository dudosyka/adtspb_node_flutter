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

  Future<Stream?> request(String query, Object data) async {
    return await this.httpRequest.then((HttpClientRequest value) {
      value.headers.add("Authorization", "Bearer-" + this.token);

      value.write(query);
      value.write(data);
      value.close().then((HttpClientResponse response) {
        return response.transform(utf8.decoder);
      });
    });
  }
}
