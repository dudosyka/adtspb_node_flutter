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
        " query { getChildren {id, name, surname, lastname, phone, email, birthday, ovz, ovz_type { id }, disability, disability_group { id } } }";
    Object data = {};
    dynamic res = await this.api.request(query, data, 'getChildren');
    return res["data"];
  }

  Future<bool> updateChild(Map child) async {
    log(child.toString());
    int id = int.parse(child['id']);
    Map<String, dynamic> childData = {};

    child.keys.forEach((index) {
      dynamic el = child[index];
      log(el.runtimeType.toString());
      if (index == '_index' || index == '_provider') return;

      Map<String, dynamic> value = {};
      if (el.runtimeType.toString() ==
          "_InternalLinkedHashMap<String, dynamic>") {
        el.keys.forEach((subindex) {
          dynamic subel = el[subindex];
          value.addAll({subindex: subel});
        });
        childData.addAll({index: value});
      } else {
        childData.addAll({index: el});
      }
    });

    log(childData.toString());

    String query =
        "mutation (\$data: UserInput, \$target_id: Int) {editMainUserData(newData: \$data, target_id: \$target_id)}";
    Object data = {
      "data": childData,
      "target_id": id,
    };
    dynamic res = await this.api.request(query, data, "editMainUserData");
    //Send request on update
    log(res.toString());
    return true;
  }
}
