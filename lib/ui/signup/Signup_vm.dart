import 'dart:convert';

import 'package:eunimart/helpers/connection_helper.dart';
import 'package:eunimart/helpers/sp_helper.dart';
import 'package:http/http.dart' as http;
import 'package:eunimart/util/app_constants.dart';

import '../../app_models.dart';

class SignupVM {
  ConnectionHelper mCH;
  SharedPreferenceHelper mSP;

  SignupVM() {
    mCH = ConnectionHelper.getInstance();
    mSP = SharedPreferenceHelper.getInstance();
  }

  Future<SignupRes> callSignupAPI(
      String email, String password, String cpassword) async {
    SignupRes resD;
    bool con = await mCH.checkConnection();
    // check for internect connection
    if (con) {
      var reqBody = {
        "email": email,
        "password": password,
        "password_confirmation": cpassword
      };
      var reqD = json.encode(reqBody);

      try {
        const URL = "$BASE_URL/api/v2/users/register/user";
        print('URL ---> $URL');
        print('BODY ---> $reqD');

        final res = await http.post(URL, headers: JSON_HEADERS, body: reqD);

        switch (res.statusCode) {
          case 200:
            final jData = json.decode(res.body);
            print('Res ---> ${res.body}');
            resD = SignupRes.fromJson(jData);

            if (resD.status) {
              mSP.saveTokenAndAccountId(resD?.loginData?.token,
                  resD?.loginData?.accountId, resD?.loginData?.userId);
            }
            return resD;
          default:
            // HTTP Error
            return SignupRes.buildErr(res.statusCode);
        }
      } catch (err) {
        // JSON error for json req and response
        return SignupRes.buildErr(0, message: err.toString());
      }
    } else {
      // when user is not having internet
      return SignupRes.buildErr(1);
    }
  }
}
