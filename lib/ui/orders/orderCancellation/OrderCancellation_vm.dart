import 'package:eunimart/helpers/connection_helper.dart';
import 'package:eunimart/helpers/sp_helper.dart';
import 'package:http/http.dart' as http;
import 'package:eunimart/util/app_constants.dart';
import 'package:eunimart/app_models.dart';
import 'dart:convert';

class OrderCancellationVM {
  ConnectionHelper mCH;
  SharedPreferenceHelper mSP;
  OrderCancellationVM() {
    mCH = ConnectionHelper.getInstance();
    mSP = SharedPreferenceHelper.getInstance();
  }

  Future<OrderCancellationRes> submitCancellationData(
      String reasonCode,
      String channelID,
      String orderId,
      String orderItemId,
      int itemQty,
      String skuId,
      String marketplaceId) async {
    OrderCancellationRes resD;
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
              "reason_code": reasonCode,
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
            "$ORDER_MANAGEMENT/api/v2/marketplace_process_manager/sync?channel_id=$channelID&account_id=$accountID&sync_type=orders.cacel";
        print('URL ---> $url');
        print('BODY ---> $reqD');

        final res = await http.post(url, headers: JSON_HEADERS, body: reqD);

        switch (res.statusCode) {
          case 200:
            final jData = json.decode(res.body);
            print('Res ---> ${res.body}');
            resD = OrderCancellationRes.fromJson(jData);

            if (resD.status) {}
            return resD;
          default:
            // HTTP Error
            return OrderCancellationRes.buildErr(res.statusCode);
        }
      } catch (err) {
        // JSON error for json req and response
        return OrderCancellationRes.buildErr(0, message: err.toString());
      }
    } else {
      // when user is not having internet
      return OrderCancellationRes.buildErr(1);
    }
  }
}
