import 'package:eunimart/helpers/connection_helper.dart';
import 'package:eunimart/helpers/sp_helper.dart';
import 'package:http/http.dart' as http;
import 'package:eunimart/util/app_constants.dart';
import 'package:eunimart/app_models.dart';
import 'dart:convert';

class KycVM {
  ConnectionHelper mCH;
  SharedPreferenceHelper mSP;
  KycVM() {
    mCH = ConnectionHelper.getInstance();
    mSP = SharedPreferenceHelper.getInstance();
  }

  Future<KycRes> getKycData() async {
    KycRes resD;
    bool con = await mCH.checkConnection();
    // check for internect connection
    if (con) {
      BasicM mspData = await mSP.getTokenAndAccountId();

      var accountID = mspData.account_id;
      print('$accountID');

      try {
        var url = "$BASE_URL/api/v2/users/get-kyc-info/$accountID";
        print('URL ---> $url');

        final res = await http.get(url, headers: JSON_HEADERS);

        switch (res.statusCode) {
          case 200:
            final jData = json.decode(res.body);
            // print('${jData.status}');
            print('Res ---> ${res.body}');
            resD = KycRes.fromJson(jData);
            resD.isLoading = false;
            return resD;
          default:
            // HTTP Error
            return KycRes.buildErr(res.statusCode);
        }
      } catch (err) {
        // JSON error for json req and response
        return KycRes.buildErr(0, message: err.toString());
      }
    } else {
      // when user is not having internet
      return KycRes.buildErr(1);
    }
  }
}
