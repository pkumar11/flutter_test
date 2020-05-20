import 'dart:convert';

import 'package:eunimart/helpers/connection_helper.dart';
import 'package:eunimart/helpers/sp_helper.dart';
import 'package:http/http.dart' as http;
import 'package:eunimart/util/app_constants.dart';

import '../../app_models.dart';

class LoginVM {
  ConnectionHelper mCH;
  SharedPreferenceHelper mSP;

  LoginVM() {
    mCH = ConnectionHelper.getInstance();
    mSP = SharedPreferenceHelper.getInstance();
  }

  Future<LoginRes> callLoginAPI(String email, String password) async {
    LoginRes res_d;
    bool con = await mCH.checkConnection();
    // check for internect connection
    if (con) {
      var req_body = {"email": email, "password": password};
      var req_d = json.encode(req_body);

      try {
        const URL = "${BASE_URL}/api/v2/users/login";
        print('URL ---> $URL');
        print('BODY ---> ${req_d}');

        final res = await http.post(URL, headers: JSON_HEADERS, body: req_d);

        switch (res.statusCode) {
          case 200:
            final j_data = json.decode(res.body);
            print('Res ---> ${res.body}');
            res_d = LoginRes.fromJson(j_data);

            if (res_d.status) {
              mSP.saveTokenAndAccountId(res_d?.loginData?.token,
                  res_d?.loginData?.account_id, res_d?.loginData?.user_id);
            }
            return res_d;
          default:
            // HTTP Error
            return LoginRes.buildErr(res.statusCode);
        }
      } catch (err) {
        // JSON error for json req and response
        return LoginRes.buildErr(0, message: err.toString());
      }
    } else {
      // when user is not having internet
      return LoginRes.buildErr(1);
    }
  }
}
