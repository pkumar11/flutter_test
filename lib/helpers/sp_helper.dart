import 'package:shared_preferences/shared_preferences.dart';
import 'package:th_app/app_models.dart';
import 'package:th_app/util/app_constants.dart';


class SharedPreferenceHelper{
  static SharedPreferenceHelper getInstance() {
    SharedPreferenceHelper mS;
    return mS != null ? mS : SharedPreferenceHelper();
  }


  Future<BasicM> getTokenAndAccountId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token =
    prefs.getString(USER_TOKEN) != null ? prefs.getString(USER_TOKEN) : '';
    String account_id =
    prefs.getString(ACCOUNT_ID) != null ? prefs.getString(ACCOUNT_ID) : '';
    BasicM _b = BasicM()
      ..token = token
      ..account_id = account_id;
    return _b;
  }

  Future<bool> saveTokenAndAccountId(String token, String account_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(USER_TOKEN, token);
    prefs.setString(ACCOUNT_ID, account_id);
    return true;
  }
}