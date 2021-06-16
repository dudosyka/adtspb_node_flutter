import 'package:localstorage/localstorage.dart';

class MyLocalStorage {
  late LocalStorage storage;

  MyLocalStorage() {
    this.storage = new LocalStorage("adt_storage");
  }

  String? getToken() {
    return this.storage.getItem('token');
  }

  String? get token => this.getToken();

  set token(String? token) {
    this.storage.setItem("token", token);
  }
}
