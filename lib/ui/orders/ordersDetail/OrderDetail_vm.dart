import 'package:eunimart/helpers/connection_helper.dart';
import 'package:eunimart/helpers/sp_helper.dart';
import 'package:http/http.dart' as http;
import 'package:eunimart/util/app_constants.dart';
import 'package:eunimart/app_models.dart';
import 'dart:convert';

class OrderDetailVM {
  ConnectionHelper mCH;
  SharedPreferenceHelper mSP;
  OrderDetailVM() {
    mCH = ConnectionHelper.getInstance();
    mSP = SharedPreferenceHelper.getInstance();
  }

  Future<SingleOrderRes> getSingleOrderData(
      String orderId, String channelId) async {
    SingleOrderRes resD;
    bool con = await mCH.checkConnection();
    // check for internect connection
    if (con) {
      BasicM mspData = await mSP.getTokenAndAccountId();

      var accountId = mspData.account_id;
      print('$accountId');

      try {
        var url =
            "$ORDER_MANAGEMENT/api/v2/orders_managment/orders/order?account_id=$accountId&order_id=$orderId&channel_id=$channelId";
        print('URL ---> $url');

        final res = await http.get(url, headers: JSON_HEADERS);
        print('${res.body}');
        switch (res.statusCode) {
          case 200:
            final jData = json.decode(res.body);
            print('Res ---> ${res.body}');
            resD = SingleOrderRes.fromJson(jData);
            resD.is_loading = false;
            return resD;
          default:
            // HTTP Error
            return SingleOrderRes.buildErr(res.statusCode);
        }
      } catch (err) {
        // JSON error for json req and response
        return SingleOrderRes.buildErr(0, message: err.toString());
      }
    } else {
      // when user is not having internet
      return SingleOrderRes.buildErr(1);
    }
  }
}
