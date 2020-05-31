import 'package:eunimart/helpers/connection_helper.dart';
import 'package:eunimart/helpers/sp_helper.dart';
import 'package:http/http.dart' as http;
import 'package:eunimart/util/app_constants.dart';
import 'package:eunimart/app_models.dart';
import 'dart:convert';

class TrackingVM {
  ConnectionHelper mCH;
  SharedPreferenceHelper mSP;
  TrackingVM() {
    mCH = ConnectionHelper.getInstance();
    mSP = SharedPreferenceHelper.getInstance();
  }
  Future<TrackingLogisticsRes> getLogisticsData() async {
    TrackingLogisticsRes resD;
    bool con = await mCH.checkConnection();
    // check for internect connection
    if (con) {
      BasicM mspData = await mSP.getTokenAndAccountId();

      var userID = mspData.user_id;
      print('$userID');

      try {
        var url = "$SHIPPING_MANAGEMENT/api/v2/shipping_management/logistics";
        print('URL ---> $url');

        final res = await http.get(url, headers: JSON_HEADERS);

        switch (res.statusCode) {
          case 200:
            final jData = json.decode(res.body);
            print('Res ---> ${res.body}');
            resD = TrackingLogisticsRes.fromJson(jData);
            resD.is_loading = false;
            return resD;
          default:
            // HTTP Error
            return TrackingLogisticsRes.buildErr(res.statusCode);
        }
      } catch (err) {
        // JSON error for json req and response
        return TrackingLogisticsRes.buildErr(0, message: err.toString());
      }
    } else {
      // when user is not having internet
      return TrackingLogisticsRes.buildErr(1);
    }
  }
}
