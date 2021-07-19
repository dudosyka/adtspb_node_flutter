import 'dart:developer';

import 'model.dart';

class UserModel extends Model {
  Future<Object?> getViewerData() async {
    String query = "query { user { data { id, name, surname, lastname } } }";
    Object data = {};
    dynamic res = await this.api.request(query, data, 'user');
    return res["data"]['data'];
  }

  Future<Object?> getChildren() async {
    String query =
        " query { user { children {id, name, surname, lastname, phone, email, sex, birthday, state, studyPlace, residence_address, registration_address, ovz, ovz_type { id }, disability, disability_group { id } } } }";
    Object data = {};
    dynamic res = await this.api.request(query, data, 'user');
    // log(res['data'].toString());
    return res["data"]['children'];
  }

  Future<bool> updateMainData(Map data) async {
    return await this.updateChild(data, "editMainData");
  }

  Future<bool> updateExtraData(Map data) async {
    return await this.updateChild(data, "editExtraData");
  }

  Future<bool> updateChild(Map child, String dataType) async {
    int id = int.parse(child['id']);
    Map<String, dynamic> childData = {};

    child.keys.forEach((index) {
      if (index == "id") return;
      dynamic el = child[index];
      if (index == '_index' || index == '_provider') return;

      Map<String, dynamic> value = {};
      if (el.runtimeType.toString() ==
          "_InternalLinkedHashMap<String, dynamic>") {
        el.keys.forEach((subindex) {
          dynamic subEl = el[subindex];
          value.addAll({subindex: subEl});
        });
        childData.addAll({index: value});
      } else if (el != false) {
        childData.addAll({index: el});
      }
    });

    if (childData.length <= 0) return true;

    String query = "mutation (\$data: UserInput, \$target_id: Int) {user {" +
        dataType +
        "(newData: \$data, target_id: \$target_id)}}";
    Object data = {
      "data": childData,
      "target_id": id,
    };
    dynamic res = await this.api.request(query, data, "user");
    //Send request on update
    return true;
  }

  void deleteChild({id, reason = "NS", removeAccount: false}) async {
    String req =
        "mutation (\$id: Int, \$reason: String, \$remove: Boolean) { user { removeChild (child_id: \$id, removeAccount: \$remove, comment: \$reason) } }";
    dynamic data = {
      "id": int.parse(id.toString()),
      "reason": reason,
      "remove": removeAccount,
    };
    dynamic res = await this.api.request(req, data, 'user');
    log(res.toString());
  }
}
