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
    return this.httpClient.post("192.168.12.68", 8080, this.route);
  }
}
