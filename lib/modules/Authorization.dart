import 'dart:developer';

import 'package:adtspb/modules/LocalStorage.dart';
import 'package:adtspb/modules/api/EndoorApi.dart';
import 'package:adtspb/modules/api/MainApi.dart';

class Authorization {
  String? login;
  String? password;
  late MyLocalStorage storage;

  Authorization({this.login, this.password}) {
    this.storage = new MyLocalStorage();
  }

  checkToken() {
    String? token = this.storage.getToken();
    log(token!);
    MainApi api = new MainApi();
    String query = "query(\$token: String) { validToken(token: \$token) }";
    Object data = {
      "token": token,
    };
    api.request(query, data).then((Stream? stream) {
      stream!.listen((event) {
        // log(event);
      });
    });
  }

  auth() async {
    EndoorApi api = new EndoorApi();
    String query =
        'mutation(\$login: String, \$password: String) { login(login: \$login, password: \$password) { token, id } }';
    Object data = {
      "login": login,
      "password": password,
    };
    Map res = await api.request(query, data, "login");
    if (res["data"] != null) {
      this.storage.token = res["data"]["token"];
      log(this.storage.token!);
      return true;
    } else {
      return false;
    }
  }

  logout() {
    this.storage.token = null;
  }
}
