import 'dart:io';

abstract class Api {
  late String token;
  late Future<HttpClientRequest> httpRequest;

  String route;

  Api(this.route) {
    HttpClient httpClient = new HttpClient();
    // Uri uri = Uri.parse("http://dudosyka-pc:8080/" + this.route);
    this.httpRequest = httpClient.post("192.168.1.62", 8080, this.route);
  }
}
