import 'dart:convert';
import 'dart:developer';
import 'dart:io';

abstract class Api {
  late String token;
  late HttpClient httpClient = new HttpClient();

  String route;

  Api(this.route) {
    // this.httpClient = new HttpClient();
    // Uri uri = Uri.parse("http://dudosyka-pc:8080/" + this.route);
    // this.httpRequest = httpClient.post("192.168.1.62", 8080, this.route);
  }

  get httpRequest {
    // return this.httpClient.post("192.168.12.68", 8080, this.route);
    return this.httpClient.post("test.lk.adtspb.ru", 80, this.route);
  }

  Future<Map> request(String query, Object data, String name,
      [Map<String, String>? headers]) async {
    Map body = {"query": "$query", "variables": data};
    HttpClientRequest request = await this.httpRequest;
    headers!.keys.forEach((name) {
      String el = headers[name]!;
      request.headers.add(name, el);
    });
    request.headers.add('content-type', 'application/json');
    request.add(utf8.encode(json.encode(body)));
    HttpClientResponse response = await request.close();
    late Map reply;
    if (response.statusCode == 200) {
      reply = json.decode(await response.transform(utf8.decoder).join());
      reply["data"] = reply["data"][name];
      reply["errors"] = reply["errors"] ?? {};
    } else {
      reply = json.decode(await response.transform(utf8.decoder).join());
      log(reply.toString());
      reply = {"data": null, "errors": "request failed"};
    }
    return reply;
  }
}
