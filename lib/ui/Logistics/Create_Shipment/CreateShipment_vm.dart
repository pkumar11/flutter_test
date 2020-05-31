import 'package:eunimart/helpers/connection_helper.dart';
import 'package:eunimart/helpers/sp_helper.dart';
import 'package:http/http.dart' as http;
import 'package:eunimart/util/app_constants.dart';
import 'package:eunimart/app_models.dart';
import 'dart:convert';

class ListWarehouseAddressVm {
  ConnectionHelper mCH;
  SharedPreferenceHelper mSP;
  ListWarehouseAddressVm() {
    mCH = ConnectionHelper.getInstance();
    mSP = SharedPreferenceHelper.getInstance();
  }

  Future<ListWarehouseAddressRes> getWarehouseAddressData() async {
    ListWarehouseAddressRes res_d;
    bool con = await mCH.checkConnection();
    // check for internect connection
    if (con) {
      BasicM mspData = await mSP.getTokenAndAccountId();

      var userID = mspData.user_id;
      var accountId=mspData.account_id;
      print('$userID');


      try {
        var URL = "$SHIPPING_MANAGEMENT/api/v2/shipping_management/warehouse_address/list?account_id=101";
        print('URL ---> $URL');

        final res = await http.get(URL, headers: JSON_HEADERS);

        switch (res.statusCode) {
          case 200:
            final jData = json.decode(res.body);
            print('Res ---> ${res.body}');
            res_d = ListWarehouseAddressRes.fromJson(jData);
            res_d.is_loading = false;
            return res_d;
          default:
            // HTTP Error
            return ListWarehouseAddressRes.buildErr(res.statusCode);
        }
      } catch (err) {
        // JSON error for json req and response
        return ListWarehouseAddressRes.buildErr(0, message: err.toString());
      }
    }else {
      // when user is not having internet
      return ListWarehouseAddressRes.buildErr(1);
    }
  }

}