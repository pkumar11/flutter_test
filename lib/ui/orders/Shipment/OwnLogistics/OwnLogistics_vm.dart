import 'package:eunimart/helpers/connection_helper.dart';
import 'package:eunimart/helpers/sp_helper.dart';
import 'package:http/http.dart' as http;
import 'package:eunimart/util/app_constants.dart';
import 'package:eunimart/app_models.dart';
import 'dart:convert';

class OwnLogisticsVM {
  ConnectionHelper mCH;
  SharedPreferenceHelper mSP;
  OwnLogisticsVM() {
    mCH = ConnectionHelper.getInstance();
    mSP = SharedPreferenceHelper.getInstance();
  }
  Future<OwnLogisticsRes> getLogisticsData() async {
    OwnLogisticsRes resD;
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
            resD = OwnLogisticsRes.fromJson(jData);
            resD.is_loading = false;
            return resD;
          default:
            // HTTP Error
            return OwnLogisticsRes.buildErr(res.statusCode);
        }
      } catch (err) {
        // JSON error for json req and response
        return OwnLogisticsRes.buildErr(0, message: err.toString());
      }
    } else {
      // when user is not having internet
      return OwnLogisticsRes.buildErr(1);
    }
  }

  Future<OwnLogisticsSubmitRes> submitLogisticsData(
      String awbNo,
      String shipmentId,
      String channelID,
      String orderId,
      String orderItemId,
      int itemQty,
      String skuId,
      String marketplaceId) async {
    OwnLogisticsSubmitRes resD;
    bool con = await mCH.checkConnection();
    // check for internect connection
    if (con) {
      BasicM mspData = await mSP.getTokenAndAccountId();

      var accountID = mspData.account_id;
      var reqBody = {
        "data": {
          "channel_id": channelID,
          "account_id": accountID,
          "order_id": orderId,
          "event_data": {
            "process": {
              "awb_no": awbNo,
              "shipping_partner_id": shipmentId,
              "order_item_ids": [
                {
                  "order_item_id": orderItemId,
                  "item_qty": itemQty,
                  "sku_id": skuId,
                  "marketplace_id": marketplaceId
                }
              ]
            }
          }
        }
      };
      var reqD = json.encode(reqBody);

      try {
        print(accountID);
        final url =
            "$ORDER_MANAGEMENT/api/v2/marketplace_process_manager/sync?channel_id=$channelID&account_id=$accountID&sync_type=orders.process_own_logistics";
        print('URL ---> $url');
        print('BODY ---> $reqD');

        final res = await http.post(url, headers: JSON_HEADERS, body: reqD);

        switch (res.statusCode) {
          case 200:
            final jData = json.decode(res.body);
            print('Res ---> ${res.body}');
            resD = OwnLogisticsSubmitRes.fromJson(jData);

            if (resD.status) {}
            return resD;
          default:
            // HTTP Error
            return OwnLogisticsSubmitRes.buildErr(res.statusCode);
        }
      } catch (err) {
        // JSON error for json req and response
        return OwnLogisticsSubmitRes.buildErr(0, message: err.toString());
      }
    } else {
      // when user is not having internet
      return OwnLogisticsSubmitRes.buildErr(1);
    }
  }
}
