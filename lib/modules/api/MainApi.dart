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

  Future<Map> request(String query, Object data, String name) async {
    Map body = {"query": "$query", "variables": data};
    HttpClientRequest request = await this.httpRequest;
    request.headers.add('content-type', 'application/json');
    request.headers.add('Authorization', "Bearer " + this.token);
    request.add(utf8.encode(json.encode(body)));
    HttpClientResponse response = await request.close();
    late Map reply;
    if (response.statusCode == 200) {
      reply = json.decode(await response.transform(utf8.decoder).join());
      reply["data"] = reply["data"][name];
      reply["errors"] = reply["errors"] ?? {};
    } else
      reply = {"data": null, "errors": "request failed"};
    return reply;
  }
}
