import 'model.dart';

class UserModel extends Model {
  Future<Object?> getViewerData() async {
    String query = "query { viewer { id, name, surname, lastname } }";
    Object data = {};
    dynamic res = await this.api.request(query, data, 'viewer');
    // await Future.delayed(Duration(seconds: 2));
    return res["data"];
  }
}
