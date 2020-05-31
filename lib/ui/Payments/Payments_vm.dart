import 'package:eunimart/helpers/connection_helper.dart';
import 'package:eunimart/helpers/sp_helper.dart';
import 'package:http/http.dart' as http;
import 'package:eunimart/util/app_constants.dart';
import 'package:eunimart/app_models.dart';
import 'dart:convert';

class PaymentsVM {
  ConnectionHelper mCH;
  SharedPreferenceHelper mSP;
  PaymentsVM() {
    mCH = ConnectionHelper.getInstance();
    mSP = SharedPreferenceHelper.getInstance();
  }

  Future<PaymentRes> getPaymentData() async {
    PaymentRes resD;
    bool con = await mCH.checkConnection();
    // check for internect connection
    if (con) {
      BasicM mspData = await mSP.getTokenAndAccountId();

      var accountID = mspData.account_id;
      print('$accountID');

      try {
        var url =
            "$ORDER_MANAGEMENT/api/v2/orders_managment/orders/get_payment_reco?account_id=$accountID&statement_of_accounts=false&pageNo=1&perPage=10";
        print('URL ---> $url');

        final res = await http.get(url, headers: JSON_HEADERS);
        print('${res.body}');
        switch (res.statusCode) {
          case 200:
            final jData = json.decode(res.body);
            print('Res ---> ${res.body}');
            resD = PaymentRes.fromJson(jData);
            resD.is_loading = false;
            return resD;
          default:
            // HTTP Error
            return PaymentRes.buildErr(res.statusCode);
        }
      } catch (err) {
        // JSON error for json req and response
        return PaymentRes.buildErr(0, message: err.toString());
      }
    } else {
      // when user is not having internet
      return PaymentRes.buildErr(1);
    }
  }

  Future<PaymentRes> getMorePaymentData(int pageNO) async {
    PaymentRes resD;
    bool con = await mCH.checkConnection();
    // check for internect connection
    if (con) {
      BasicM mspData = await mSP.getTokenAndAccountId();

      var accountID = mspData.account_id;
      print('$accountID');

      try {
        var url =
            "$ORDER_MANAGEMENT/api/v2/orders_managment/orders/get_payment_reco?account_id=$accountID&statement_of_accounts=false&pageNo=$pageNO&perPage=10";
        print('URL ---> $url');

        final res = await http.get(url, headers: JSON_HEADERS);
        print('${res.body}');
        switch (res.statusCode) {
          case 200:
            final jData = json.decode(res.body);
            print('Res ---> ${res.body}');
            resD = PaymentRes.fromJson(jData);
            resD.is_loading = false;
            return resD;
          default:
            // HTTP Error
            return PaymentRes.buildErr(res.statusCode);
        }
      } catch (err) {
        // JSON error for json req and response
        return PaymentRes.buildErr(0, message: err.toString());
      }
    } else {
      // when user is not having internet
      return PaymentRes.buildErr(1);
    }
  }
}
