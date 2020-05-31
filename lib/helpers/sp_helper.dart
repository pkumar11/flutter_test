import 'package:shared_preferences/shared_preferences.dart';
import 'package:eunimart/app_models.dart';
import 'package:eunimart/util/app_constants.dart';

class SharedPreferenceHelper {
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
    String user_id =
        prefs.getString(USER_ID) != null ? prefs.getString(USER_ID) : '';
    BasicM _b = BasicM()
      ..token = token
      ..account_id = account_id
      ..user_id = user_id;

    return _b;
  }

  Future<bool> saveTokenAndAccountId(
      String token, String account_id, String user_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(USER_TOKEN, token);
    prefs.setString(ACCOUNT_ID, account_id);
    prefs.setString(USER_ID, user_id);

    return true;
  }
}
