import 'package:eunimart/helpers/connection_helper.dart';
import 'package:eunimart/helpers/sp_helper.dart';
import 'package:http/http.dart' as http;
import 'package:eunimart/util/app_constants.dart';
import 'package:eunimart/app_models.dart';
import 'dart:convert';

class ProflieVM {
  ConnectionHelper mCH;
  SharedPreferenceHelper mSP;
  ProflieVM() {
    mCH = ConnectionHelper.getInstance();
    mSP = SharedPreferenceHelper.getInstance();
  }

  Future<ProfileRes> getProfileData() async {
    ProfileRes res_d;
    bool con = await mCH.checkConnection();
    // check for internect connection
    if (con) {
      BasicM mspData = await mSP.getTokenAndAccountId();

      var userID = mspData.user_id;
      print('$userID');

      try {
        var URL = "$BASE_URL/api/v2/users/get-user-info/$userID";
        print('URL ---> $URL');

        final res = await http.get(URL, headers: JSON_HEADERS);

        switch (res.statusCode) {
          case 200:
            final jData = json.decode(res.body);
            print('Res ---> ${res.body}');
            res_d = ProfileRes.fromJson(jData);
            res_d.is_loading = false;
            return res_d;
          default:
            // HTTP Error
            return ProfileRes.buildErr(res.statusCode);
        }
      } catch (err) {
        // JSON error for json req and response
        return ProfileRes.buildErr(0, message: err.toString());
      }
    } else {
      // when user is not having internet
      return ProfileRes.buildErr(1);
    }
  }
}
