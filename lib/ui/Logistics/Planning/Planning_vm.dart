import 'package:eunimart/helpers/connection_helper.dart';
import 'package:eunimart/helpers/sp_helper.dart';
import 'package:http/http.dart' as http;
import 'package:eunimart/util/app_constants.dart';
import 'package:eunimart/app_models.dart';
import 'dart:convert';

class PlanningVM {
  ConnectionHelper mCH;
  SharedPreferenceHelper mSP;
  PlanningVM() {
    mCH = ConnectionHelper.getInstance();
    mSP = SharedPreferenceHelper.getInstance();
  }

  Future<PlanningRes> submitPlanningData(
      double length,
      double width,
      double height,
      double weight,
      String fromDropDown,
      String toDropDown) async {
    PlanningRes resD;
    print('$length  $width  $height  $weight $fromDropDown  $toDropDown');
    bool con = await mCH.checkConnection();
    // check for internect connection
    if (con) {
      BasicM mspData = await mSP.getTokenAndAccountId();
      var reqBody = {
        "data": {
          "from": fromDropDown,
          "to": toDropDown,
          "length": length,
          "width": width,
          "height": height,
          "weight": weight
        }
      };
      var data = json.encode(reqBody);

      var accountID = mspData.account_id;
      print('$accountID');
      print('$data==>');

      try {
        var url =
            "https://idp-testing.vdezi.com/api/v2/calculator/logistics?shipment_type=international&account_id=$accountID";
        final res = await http.post(url, headers: JSON_HEADERS, body: data);
        switch (res.statusCode) {
          case 200:
            // final jData = json.decode(res.body);
            Map<String, dynamic> jData = json.decode(res.body);

            // var jjdta = json.decode(jData);
            // print('====???>>$jjdta');
            print('Res ---> ${res.body}');

            resD = PlanningRes.fromJson(jData);
            resD.is_loading = false;
            // print('<===>>  ${jData.data} <<===>>');
            return resD;
          default:
            // HTTP Error
            return PlanningRes.buildErr(res.statusCode);
        }
      } catch (err) {
        // JSON error for json req and response
        return PlanningRes.buildErr(0, message: err.toString());
      }
    } else {
      // when user is not having internet
      return PlanningRes.buildErr(1);
    }
  }
}
