// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRes _$LoginResFromJson(Map<String, dynamic> json) {
  return LoginRes(
      name: json['name'] as String,
      loginData: json['data'] == null
          ? null
          : LoginData.fromJson(json['data'] as Map<String, dynamic>))
    ..status = json['status'] as bool
    ..message = json['message'] as String
    ..is_loading = json['is_loading'] as bool;
}

Map<String, dynamic> _$LoginResToJson(LoginRes instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'is_loading': instance.is_loading,
      'name': instance.name,
      'data': instance.loginData
    };

LoginData _$LoginDataFromJson(Map<String, dynamic> json) {
  return LoginData(
      user_id: json['user_id'] as String,
      account_id: json['account_id'] as String,
      token: json['token'] as String);
}

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'user_id': instance.user_id,
      'account_id': instance.account_id,
      'token': instance.token
    };
