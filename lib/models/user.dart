import 'dart:developer';

import 'model.dart';

class UserModel extends Model {
  Future<Object?> getViewerData() async {
    String query = "query { viewer { id, name, surname, lastname } }";
    Object data = {};
    dynamic res = await this.api.request(query, data, 'viewer');
    // await Future.delayed(Duration(seconds: 2));
    return res["data"];
  }

  Future<Object?> getChildren() async {
    String query =
        " query { getChildren {id, name, surname, phone, birthday, ovz, ovz_type { id }, disability, disability_group { id } } }";
    Object data = {};
    dynamic res = await this.api.request(query, data, 'getChildren');
    return res["data"];
  }

  Future<bool> updateChild(child) async {
    log(child.toString());
    int id = int.parse(child['id']);
    String query =
        "mutation (\$data: UserInput, \$target_id: Int) {editMainUserData(newData: \$data, target_id: \$target_id)}";
    Object data = {
      "data": {
        "name": child['name'],
        "surname": child['surname'],
      },
      "target_id": id,
    };
    dynamic res = await this.api.request(query, data, "editMainUserData");
    //Send request on update
    log(res.toString());
    return true;
  }
}
