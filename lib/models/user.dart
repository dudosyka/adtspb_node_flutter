import 'model.dart';

class UserModel extends Model {
  Future<Object?> getData() async {
    String query = "query { viewer { id, name, surname, lastname } }";
    Object data = {};
    dynamic res = await this.api.request(query, data, 'viewer');
    return res["data"];
  }
}
