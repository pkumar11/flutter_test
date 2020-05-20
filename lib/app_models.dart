// import 'dart:js';
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'app_models.g.dart';

//******************************** Login ********************************/
@JsonSerializable()
class LoginRes extends Base {
  String name;
  @JsonKey(name: "data")
  LoginData loginData;
  LoginRes({this.name, this.loginData});

  factory LoginRes.fromJson(Map<String, dynamic> json) =>
      _$LoginResFromJson(json);

  static LoginRes buildErr(int Errcode, {String message}) {
    LoginRes res_d = LoginRes();
    Base _b = res_d.buildError(Errcode, message: message);
//    res_d.message = _b.message;
//    res_d.status = _b.status;
//    res_d.is_loading = _b.is_loading;
    return res_d
      ..message = _b.message
      ..status = _b.status
      ..is_loading = _b.is_loading;
  }
}

@JsonSerializable()
class LoginData {
  String user_id;
  String account_id;
  String token;
  LoginData({this.user_id, this.account_id, this.token});

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}

class Base {
  bool status;
  String message;
  bool is_loading;

  Base({this.status, this.message, this.is_loading});

  Base buildError(int Errcode, {String message}) {
    var _h = Base()
      ..status = false
      ..is_loading = false;
    switch (Errcode) {
      case 0:
        return _h..message = 'Failed to connect server Error Details: $message';
      case 1:
        return _h..message = 'Check your internet connection';
      default:
        return _h..message = 'HTTP: Status Code $Errcode';
    }
  }
}

//******************************** Profile ********************************/
@JsonSerializable()
class ProfileRes extends Base {
  bool status;
  bool is_loading;
  ProfileData data;
  ProfileRes({this.status, this.data});

  factory ProfileRes.fromJson(Map<String, dynamic> json) =>
      _$ProfileResFromJson(json);

  static ProfileRes buildErr(int Errcode, {String message}) {
    ProfileRes res_d = ProfileRes();
    Base _b = res_d.buildError(Errcode, message: message);
//    res_d.message = _b.message;
//    res_d.status = _b.status;
//    res_d.is_loading = _b.is_loading;
    return res_d
      ..message = _b.message
      ..status = _b.status
      ..is_loading = _b.is_loading;
  }
}

@JsonSerializable()
class ProfileData {
  String first_name;
  String last_name;
  String gender;
  String designation;
  String profile_picture;
  String date_of_birth;
  ProfileData(
      {this.first_name,
      this.last_name,
      this.gender,
      this.designation,
      this.profile_picture,
      this.date_of_birth});

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
}

class BasicM {
  String token;
  String user_id;
  String account_id;
  BasicM({this.token, this.account_id, this.user_id});
}

//******************************** Planning-Logistics ********************************/
@JsonSerializable()
class PlanningRes extends Base {
  bool status;
  bool is_loading;
  List<PlanningData> data;

  PlanningRes({this.status, this.data, this.is_loading});
  factory PlanningRes.fromJson(Map<String, dynamic> json) =>
      _$PlanningResFromJson(json);

  static PlanningRes buildErr(int Errcode, {String message}) {
    PlanningRes res_d = PlanningRes();
    Base _b = res_d.buildError(Errcode, message: message);
//    res_d.message = _b.message;
//    res_d.status = _b.status;
//    res_d.is_loading = _b.is_loading;
    return res_d
      ..message = _b.message
      ..status = _b.status
      ..is_loading = _b.is_loading;
  }
}

@JsonSerializable()
class PlanningData {
  String from;
  String to;
  double length;
  double width;
  double height;
  double weight;
  double volumetric_weight;
  double weight_considered;
  double price;
  String shipping_partner_id;
  String carrier;
  String shipment_type;
  String carrier_logo;
  String timeline;
  String currency;
  PlanningData(
      {this.from,
      this.to,
      this.length,
      this.width,
      this.height,
      this.weight,
      this.volumetric_weight,
      this.weight_considered,
      this.price,
      this.shipping_partner_id,
      this.carrier,
      this.shipment_type,
      this.carrier_logo,
      this.timeline,
      this.currency});

  factory PlanningData.fromJson(Map<String, dynamic> json) =>
      _$PlanningDataFromJson(json);
}

//******************************** list-Warehouse_address-Logistics ********************************/

@JsonSerializable()
class ListWarehouseAddressRes extends Base {
  bool status;
  bool is_loading;
  List<ListWarehouseAddressData> data;

  ListWarehouseAddressRes({this.status, this.data});

  factory ListWarehouseAddressRes.fromJson(Map<String, dynamic> json) =>
      _$ListWarehouseAddressResFromJson(json);

  static ListWarehouseAddressRes buildErr(int Errcode, {String message}) {
    ListWarehouseAddressRes res_d = ListWarehouseAddressRes();
    Base _b = res_d.buildError(Errcode, message: message);
//    res_d.message = _b.message;
//    res_d.status = _b.status;
//    res_d.is_loading = _b.is_loading;
    return res_d
      ..message = _b.message
      ..status = _b.status
      ..is_loading = _b.is_loading;
  }
}

@JsonSerializable()
class ListWarehouseAddressData {
  String id;
  @JsonKey(name: "_id")
  String account_id;
  String address_name;
  String origin_country;
  String state;
  String city;
  String email;
  String phone;
  String address_1;
  String address_2;
  String postal_code;
  String created_by;
  String address_id;

  ListWarehouseAddressData(
      {this.id,
      this.account_id,
      this.address_name,
      this.origin_country,
      this.state,
      this.city,
      this.email,
      this.phone,
      this.address_1,
      this.address_2,
      this.postal_code,
      this.created_by,
      this.address_id});

  factory ListWarehouseAddressData.fromJson(Map<String, dynamic> json) =>
      _$ListWarehouseAddressDataFromJson(json);
}

//******************************** Orders ********************************/
@JsonSerializable()
class OrderRes extends Base {
  bool status;
  bool is_loading;
  List<OrderData> data;
  OrderRes({this.status, this.is_loading, this.data});

  factory OrderRes.fromJson(Map<String, dynamic> json) =>
      _$OrderResFromJson(json);

  static OrderRes buildErr(int Errcode, {String message}) {
    OrderRes res_d = OrderRes();
    Base _b = res_d.buildError(Errcode, message: message);

    return res_d
      ..message = _b.message
      ..status = _b.status
      ..is_loading = _b.is_loading;
  }
}

@JsonSerializable()
class OrderData {
  String channelId;
  @JsonKey(name: "channel_id")
  String orderId;
  @JsonKey(name: "order_id")
  String channelType;
  @JsonKey(name: "channel_type")
  String currencyCode;
  @JsonKey(name: "currnecy_code")
  double orderAmount;
  @JsonKey(name: "order_amount")
  String purchaseDate;
  @JsonKey(name: "purchase_date")
  List<OrderProductInfo> productInfo;
  @JsonKey(name: "product_info")
  OrderData(
      {this.channelId,
      this.orderId,
      this.channelType,
      this.currencyCode,
      this.orderAmount,
      this.purchaseDate,
      this.productInfo});

  factory OrderData.fromJson(Map<String, dynamic> json) =>
      _$OrderDataFromJson(json);
}

@JsonSerializable()
class OrderProductInfo {
  String productTitle;
  @JsonKey(name: "product_title")
  int itemQuantity;
  @JsonKey(name: "item_quantity")
  OrderProductInfo({this.productTitle, this.itemQuantity});

  factory OrderProductInfo.fromJson(Map<String, dynamic> json) =>
      _$OrderProductInfoFromJson(json);
}

//******************************** Kyc ********************************/
@JsonSerializable()
class KycRes extends Base {
  bool status;
  bool isLoading;
  KycData data;
  KycRes({this.status, this.isLoading, this.data});

  factory KycRes.fromJson(Map<String, dynamic> json) => _$KycResFromJson(json);

  static KycRes buildErr(int Errcode, {String message}) {
    KycRes resD = KycRes();
    Base _b = resD.buildError(Errcode, message: message);

    return resD
      ..message = _b.message
      ..status = _b.status
      ..is_loading = _b.is_loading;
  }
}

@JsonSerializable()
class KycData {
  @JsonKey(name: "aadhar_card_number")
  String aadharCardNumber;
  @JsonKey(name: "aadhar_card_file")
  String aadharCardFile;

  @JsonKey(name: "passport_file")
  String passportFile;

  @JsonKey(name: "passport_number")
  String passportNumber;
  @JsonKey(name: "bussiness_registration")
  String bussinessRegistration;
  @JsonKey(name: "bussiness_registration_file")
  String bussinessRegistrationFile;
  @JsonKey(name: "iec_number")
  String iecNumber;
  @JsonKey(name: "iec_file")
  String iecFile;
  @JsonKey(name: "gstin_file")
  String gstinFile;
  @JsonKey(name: "gstin_number")
  String gstinNumber;
  @JsonKey(name: "voter_id_number")
  String voterIdNumber;
  @JsonKey(name: "voter_id_file")
  String voterIdNumberFile;
  @JsonKey(name: "pancard_number")
  String pancardNumber;
  @JsonKey(name: "pancard_file")
  String pancardFile;
  KycData(
      {this.aadharCardFile,
      this.aadharCardNumber,
      this.bussinessRegistration,
      this.bussinessRegistrationFile,
      this.gstinFile,
      this.gstinNumber,
      this.iecFile,
      this.iecNumber,
      this.pancardFile,
      this.pancardNumber,
      this.passportFile,
      this.passportNumber,
      this.voterIdNumber,
      this.voterIdNumberFile});

  factory KycData.fromJson(Map<String, dynamic> json) =>
      _$KycDataFromJson(json);
}
