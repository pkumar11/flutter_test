import 'package:json_annotation/json_annotation.dart';

part 'app_models.g.dart';


@JsonSerializable()
class LoginRes extends Base{
  String name;
  @JsonKey(name: "data")
  LoginData loginData;
  LoginRes({this.name , this.loginData});

  factory LoginRes.fromJson(Map<String, dynamic> json) =>
      _$LoginResFromJson(json);

  static LoginRes buildErr(int Errcode, {String message}){
    LoginRes res_d = LoginRes();
    Base _b = res_d.buildError(Errcode, message: message);
//    res_d.message = _b.message;
//    res_d.status = _b.status;
//    res_d.is_loading = _b.is_loading;
    return res_d..message = _b.message..status = _b.status..is_loading = _b.is_loading;
  }

}

@JsonSerializable()
class LoginData{
  
  String user_id;
  String account_id;
  String token;
  LoginData({this.user_id, this.account_id, this.token});

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
  
} 

class Base{

  bool status;
  String message;
  bool is_loading;

  Base({this.status,this.message,this.is_loading});

  Base buildError(int Errcode, {String message}){

    var _h = Base()
      ..status = false
      ..is_loading = false;
    switch (Errcode){
      case 0:
        return _h..message = 'Failed to connect server Error Details: ${message}' ;
      case 1:
        return _h..message = 'Check your internet connection';
      default:
        return _h..message = 'HTTP: Status Code ${Errcode}';
    }
  }
}


class BasicM{
  String token;
  String account_id;
  BasicM({this.token, this.account_id});
}



