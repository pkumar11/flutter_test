import 'package:eunimart/helpers/connection_helper.dart';
import 'package:eunimart/helpers/sp_helper.dart';
import 'package:http/http.dart' as http;
import 'package:eunimart/util/app_constants.dart';
import 'package:eunimart/app_models.dart';
import 'dart:convert';

class PaymentsDetailVM {
  ConnectionHelper mCH;
  SharedPreferenceHelper mSP;
  PaymentsDetailVM() {
    mCH = ConnectionHelper.getInstance();
    mSP = SharedPreferenceHelper.getInstance();
  }

  Future<PaymentDetailRes> getPaymentData(String orderId) async {
    PaymentDetailRes resD;
    bool con = await mCH.checkConnection();
    // check for internect connection
    if (con) {
      BasicM mspData = await mSP.getTokenAndAccountId();

      var accountID = mspData.account_id;
      print('$accountID');

      try {
        var url =
            "https://idp-testing.vdezi.com/api/v2/orders_managment/orders/getOrderItemDetails?statement_of_accounts=false&order_id=$orderId&account_id=$accountID";
        print('URL ---> $url');

        final res = await http.get(url, headers: JSON_HEADERS);
        print('${res.body}');
        switch (res.statusCode) {
          case 200:
            final jData = json.decode(res.body);
            print('Res ---> ${res.body}');
            resD = PaymentDetailRes.fromJson(jData);
            resD.is_loading = false;
            return resD;
          default:
            // HTTP Error
            return PaymentDetailRes.buildErr(res.statusCode);
        }
      } catch (err) {
        // JSON error for json req and response
        return PaymentDetailRes.buildErr(0, message: err.toString());
      }
    } else {
      // when user is not having internet
      return PaymentDetailRes.buildErr(1);
    }
  }
}
