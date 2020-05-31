import 'package:eunimart/helpers/connection_helper.dart';
import 'package:eunimart/helpers/sp_helper.dart';
import 'package:http/http.dart' as http;
import 'package:eunimart/util/app_constants.dart';
import 'package:eunimart/app_models.dart';
import 'dart:convert';

class AllPlansVM {
  ConnectionHelper mCH;
  SharedPreferenceHelper mSP;
  AllPlansVM() {
    mCH = ConnectionHelper.getInstance();
    mSP = SharedPreferenceHelper.getInstance();
  }

  Future<PlansRes> getPlansData() async {
    PlansRes resD;
    bool con = await mCH.checkConnection();
    // check for internect connection
    if (con) {
      BasicM mspData = await mSP.getTokenAndAccountId();

      var accountID = mspData.account_id;
      print('$accountID');

      try {
        var url =
            "$SHIPPING_MANAGEMENT/api/v2/acls/get_user_plans?account_id=2504";
        print('URL ---> $url');

        final res = await http.get(url, headers: JSON_HEADERS);

        switch (res.statusCode) {
          case 200:
            print('$res');
            final jData = json.decode(res.body);
            print('Res ---> ${res.body}');
            resD = PlansRes.fromJson(jData);
            resD.is_loading = false;
            return resD;
          default:
            // HTTP Error
            return PlansRes.buildErr(res.statusCode);
        }
      } catch (err) {
        // JSON error for json req and response
        return PlansRes.buildErr(0, message: err.toString());
      }
    } else {
      // when user is not having internet
      return PlansRes.buildErr(1);
    }
  }
}
