import 'package:eunimart/helpers/connection_helper.dart';
import 'package:eunimart/helpers/sp_helper.dart';
import 'package:http/http.dart' as http;
import 'package:eunimart/util/app_constants.dart';
import 'package:eunimart/app_models.dart';
import 'dart:convert';

class OrderVM {
  ConnectionHelper mCH;
  SharedPreferenceHelper mSP;
  OrderVM() {
    mCH = ConnectionHelper.getInstance();
    mSP = SharedPreferenceHelper.getInstance();
  }

  Future<OrderRes> getOrderData() async {
    OrderRes resD;
    bool con = await mCH.checkConnection();
    // check for internect connection
    if (con) {
      BasicM mspData = await mSP.getTokenAndAccountId();

      var userID = mspData.user_id;
      print('$userID');

      try {
        var url =
            "$ORDER_MANAGEMENT/api/v2/orders_managment/orders/list?account_id=117&perPage=10&pageNo=1";
        print('URL ---> $url');

        final res = await http.get(url, headers: JSON_HEADERS);
        print('${res.body}');
        switch (res.statusCode) {
          case 200:
            final jData = json.decode(res.body);
            print('Res ---> ${res.body}');
            resD = OrderRes.fromJson(jData);
            resD.is_loading = false;
            return resD;
          default:
            // HTTP Error
            return OrderRes.buildErr(res.statusCode);
        }
      } catch (err) {
        // JSON error for json req and response
        return OrderRes.buildErr(0, message: err.toString());
      }
    } else {
      // when user is not having internet
      return OrderRes.buildErr(1);
    }
  }
}