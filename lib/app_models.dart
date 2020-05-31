// import 'dart:js';

import 'package:eunimart/ui/Logistics/Create_Shipment/ReceiverDetails/ReceiverDetails.dart';
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

//******************************** Signup ********************************/
@JsonSerializable()
class SignupRes extends Base {
  String name;
  @JsonKey(name: "data")
  SignupData loginData;
  SignupRes({this.name, this.loginData});

  factory SignupRes.fromJson(Map<String, dynamic> json) =>
      _$SignupResFromJson(json);

  static SignupRes buildErr(int Errcode, {String message}) {
    SignupRes resD = SignupRes();
    Base _b = resD.buildError(Errcode, message: message);
//    res_d.message = _b.message;
//    res_d.status = _b.status;
//    res_d.is_loading = _b.is_loading;
    return resD
      ..message = _b.message
      ..status = _b.status
      ..is_loading = _b.is_loading;
  }
}

@JsonSerializable()
class SignupData {
  @JsonKey(name: "user_id")
  String userId;
  @JsonKey(name: "account_id")
  String accountId;
  String token;
  SignupData({this.userId, this.accountId, this.token});

  factory SignupData.fromJson(Map<String, dynamic> json) =>
      _$SignupDataFromJson(json);
}

//******************************** Profile ********************************/
@JsonSerializable()
class ProfileRes extends Base {
  bool status;
  bool is_loading;
  ProfileData data;
  // @JsonKey(name: "error_obj")
  // ErrorObj errorobj;
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

// @JsonSerializable()
// class ErrorObj {
//   String message;
//   ErrorObj({this.message});
//   factory ErrorObj.fromJson(Map<String, dynamic> json) =>
//       _$ErrorObjFromJson(json);
// }

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
  @JsonKey(name: "data")
  List<PlanningLogisticsData> data;

  PlanningRes({this.status, this.data, this.is_loading});
  factory PlanningRes.fromJson(Map<String, dynamic> json) =>
      _$PlanningResFromJson(json);

  static PlanningRes buildErr(int Errcode, {String message}) {
    PlanningRes resD = PlanningRes();
    Base _b = resD.buildError(Errcode, message: message);
//    res_d.message = _b.message;
//    res_d.status = _b.status;
//    res_d.is_loading = _b.is_loading;
    return resD
      ..message = _b.message
      ..status = _b.status
      ..is_loading = _b.is_loading;
  }
}

@JsonSerializable()
class PlanningLogisticsData {
  String from;
  String to;
  double length;
  double width;
  double height;
  double weight;
  @JsonKey(name: "volumetric_weight")
  double volumetricWeight;
  @JsonKey(name: "weight_considered")
  double weightConsidered;
  double price;
  @JsonKey(name: "shipping_partner_id")
  String shippingPartnerId;
  String carrier;
  @JsonKey(name: "shipment_type")
  String shipmentType;
  @JsonKey(name: "carrier_logo")
  String carrierLogo;
  String timeline;
  String currency;
  PlanningLogisticsData(
      {this.from,
      this.to,
      this.length,
      this.width,
      this.height,
      this.weight,
      this.volumetricWeight,
      this.weightConsidered,
      this.price,
      this.shippingPartnerId,
      this.carrier,
      this.shipmentType,
      this.carrierLogo,
      this.timeline,
      this.currency});

  factory PlanningLogisticsData.fromJson(Map<String, dynamic> json) =>
      _$PlanningLogisticsDataFromJson(json);
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
  OrderPagination pagination;
  OrderRes({this.status, this.is_loading, this.data, this.pagination});

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
  @JsonKey(name: "channel_id")
  String channelId;
  @JsonKey(name: "order_id")
  String orderId;
  @JsonKey(name: "channel_type")
  String channelType;
  @JsonKey(name: "currency_code")
  String currencyCode;
  @JsonKey(name: "order_amount")
  double orderAmount;
  @JsonKey(name: "purchase_date")
  String purchaseDate;
  @JsonKey(name: "product_info")
  List<OrderProductInfo> productInfo;
  @JsonKey(name: "sku_ids")
  List<String> skuId;
  @JsonKey(name: "order_item_numbers")
  List<int> orderItemNumber;
  OrderData(
      {this.channelId,
      this.orderId,
      this.channelType,
      this.currencyCode,
      this.orderAmount,
      this.purchaseDate,
      this.productInfo,
      this.skuId,
      this.orderItemNumber});

  factory OrderData.fromJson(Map<String, dynamic> json) =>
      _$OrderDataFromJson(json);
}

@JsonSerializable()
class OrderProductInfo {
  @JsonKey(name: "product_title")
  String productTitle;
  @JsonKey(name: "item_quantity")
  int itemQuantity;
  @JsonKey(name: "marketplace_id")
  String marketplaceId;
  OrderProductInfo({this.productTitle, this.itemQuantity, this.marketplaceId});

  factory OrderProductInfo.fromJson(Map<String, dynamic> json) =>
      _$OrderProductInfoFromJson(json);
}

@JsonSerializable()
class OrderPagination {
  @JsonKey(name: "total_pages")
  int totalPages;
  @JsonKey(name: "per_page")
  int perPage;
  @JsonKey(name: "current_page")
  int currentPage;
  @JsonKey(name: "next_page")
  int nextpage;
  @JsonKey(name: "previous_page")
  int previousPage;
  OrderPagination(
      {this.currentPage,
      this.nextpage,
      this.perPage,
      this.previousPage,
      this.totalPages});

  factory OrderPagination.fromJson(Map<String, dynamic> json) =>
      _$OrderPaginationFromJson(json);
}

//******************************** Orders Search********************************/
@JsonSerializable()
class OrderSearchRes extends Base {
  bool status;
  bool isLoading;
  List<OrderSearchData> data;

  OrderSearchRes({this.status, this.isLoading, this.data});

  factory OrderSearchRes.fromJson(Map<String, dynamic> json) =>
      _$OrderSearchResFromJson(json);

  static OrderSearchRes buildErr(int errcode, {String message}) {
    OrderSearchRes resD = OrderSearchRes();
    Base _b = resD.buildError(errcode, message: message);

    return resD
      ..message = _b.message
      ..status = _b.status
      ..is_loading = _b.is_loading;
  }
}

@JsonSerializable()
class OrderSearchData {
  @JsonKey(name: "channel_id")
  String channelId;
  @JsonKey(name: "order_id")
  String orderId;
  @JsonKey(name: "channel_type")
  String channelType;
  @JsonKey(name: "currency_code")
  String currencyCode;
  @JsonKey(name: "order_amount")
  double orderAmount;
  @JsonKey(name: "purchase_date")
  String purchaseDate;
  @JsonKey(name: "product_info")
  List<OrderSearchProductInfo> productInfo;
  @JsonKey(name: "sku_ids")
  List<String> skuId;
  @JsonKey(name: "order_item_numbers")
  List<int> orderItemNumber;
  OrderSearchData(
      {this.channelId,
      this.orderId,
      this.channelType,
      this.currencyCode,
      this.orderAmount,
      this.purchaseDate,
      this.productInfo,
      this.skuId,
      this.orderItemNumber});

  factory OrderSearchData.fromJson(Map<String, dynamic> json) =>
      _$OrderSearchDataFromJson(json);
}

@JsonSerializable()
class OrderSearchProductInfo {
  @JsonKey(name: "product_title")
  String productTitle;
  @JsonKey(name: "item_quantity")
  int itemQuantity;
  @JsonKey(name: "marketplace_id")
  String marketplaceId;
  OrderSearchProductInfo(
      {this.productTitle, this.itemQuantity, this.marketplaceId});

  factory OrderSearchProductInfo.fromJson(Map<String, dynamic> json) =>
      _$OrderSearchProductInfoFromJson(json);
}

//******************************** Kyc ********************************/
@JsonSerializable()
class KycRes extends Base {
  bool status;
  // @JsonKey(name: "is_loading")
  bool isLoading;
  @JsonKey(name: "data")
  KycData data;
  KycRes({this.status, this.data});

  factory KycRes.fromJson(Map<String, dynamic> json) => _$KycResFromJson(json);

  static KycRes buildErr(int errCode, {String message}) {
    KycRes resD = KycRes();
    Base _b = resD.buildError(errCode, message: message);

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

//******************************** Plans ********************************/
@JsonSerializable()
class PlansRes extends Base {
  bool status;
  bool isLoading;
  // @JsonKey(name: "is_loading")
  PlansData data;
  PlansRes({this.status, this.isLoading, this.data});

  factory PlansRes.fromJson(Map<String, dynamic> json) =>
      _$PlansResFromJson(json);

  static PlansRes buildErr(int errCode, {String message}) {
    PlansRes resD = PlansRes();
    Base _b = resD.buildError(errCode, message: message);

    return resD
      ..message = _b.message
      ..status = _b.status
      ..is_loading = _b.is_loading;
  }
}

@JsonSerializable()
class PlansData {
  List<Plans> plans;
  @JsonKey(name: "plan_pricing")
  PlansPricing plansPricing;
  @JsonKey(name: "plan_comparision")
  PlansComparision plansComparision;
  PlansData({this.plans, this.plansPricing, this.plansComparision});
  factory PlansData.fromJson(Map<String, dynamic> json) =>
      _$PlansDataFromJson(json);
}

@JsonSerializable()
class Plans {
  // String planId;
  // @JsonKey(name: "plan_id")
  @JsonKey(name: "plan_details")
  PlanDetails planDetails;
  @JsonKey(name: "plan_limits")
  PlanLimits planLimits;
  Plans({this.planDetails, this.planLimits});
  factory Plans.fromJson(Map<String, dynamic> json) => _$PlansFromJson(json);
}

@JsonSerializable()
class PlanDetails {
  @JsonKey(name: "plan_name")
  String planName;
  @JsonKey(name: "plan_key")
  String planKey;
  @JsonKey(name: "plan_description")
  String planDescription;
  PlanDetails({this.planName, this.planDescription, this.planKey});
  factory PlanDetails.fromJson(Map<String, dynamic> json) =>
      _$PlanDetailsFromJson(json);
}

@JsonSerializable()
class PlanLimits {
  @JsonKey(name: "sku_ids")
  SkuId skuId;
  Orders orders;
  Marketchannels marketchannels;
  @JsonKey(name: "shipping_partners")
  ShippingPartners shippingPartners;
  @JsonKey(name: "pos_stores")
  PosStores posStores;
  @JsonKey(name: "sub_users")
  SubUsers subUsers;
  @JsonKey(name: "pos_sub_users")
  PosSubUsers posSubUsers;
  PlanLimits(
      {this.marketchannels,
      this.orders,
      this.posStores,
      this.posSubUsers,
      this.shippingPartners,
      this.skuId,
      this.subUsers});
  factory PlanLimits.fromJson(Map<String, dynamic> json) =>
      _$PlanLimitsFromJson(json);
}

@JsonSerializable()
class SkuId {
  @JsonKey(name: "limit_name")
  String limitName;
  @JsonKey(name: "limit_allowed")
  String limitAllowed;
  SkuId({this.limitAllowed, this.limitName});
  factory SkuId.fromJson(Map<String, dynamic> json) => _$SkuIdFromJson(json);
}

@JsonSerializable()
class Orders {
  @JsonKey(name: "limit_name")
  String limitName;
  @JsonKey(name: "limit_allowed")
  String limitAllowed;
  Orders({this.limitAllowed, this.limitName});
  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);
}

@JsonSerializable()
class Marketchannels {
  @JsonKey(name: "limit_name")
  String limitName;
  @JsonKey(name: "limit_allowed")
  String limitAllowed;
  Marketchannels({this.limitAllowed, this.limitName});
  factory Marketchannels.fromJson(Map<String, dynamic> json) =>
      _$MarketchannelsFromJson(json);
}

@JsonSerializable()
class ShippingPartners {
  @JsonKey(name: "limit_name")
  String limitName;
  @JsonKey(name: "limit_allowed")
  String limitAllowed;
  ShippingPartners({this.limitAllowed, this.limitName});
  factory ShippingPartners.fromJson(Map<String, dynamic> json) =>
      _$ShippingPartnersFromJson(json);
}

@JsonSerializable()
class PosStores {
  @JsonKey(name: "limit_name")
  String limitName;
  @JsonKey(name: "limit_allowed")
  String limitAllowed;
  PosStores({this.limitAllowed, this.limitName});
  factory PosStores.fromJson(Map<String, dynamic> json) =>
      _$PosStoresFromJson(json);
}

@JsonSerializable()
class SubUsers {
  @JsonKey(name: "limit_name")
  String limitName;
  @JsonKey(name: "limit_allowed")
  String limitAllowed;
  SubUsers({this.limitAllowed, this.limitName});
  factory SubUsers.fromJson(Map<String, dynamic> json) =>
      _$SubUsersFromJson(json);
}

@JsonSerializable()
class PosSubUsers {
  @JsonKey(name: "limit_name")
  String limitName;
  @JsonKey(name: "limit_allowed")
  String limitAllowed;
  PosSubUsers({this.limitAllowed, this.limitName});

  factory PosSubUsers.fromJson(Map<String, dynamic> json) =>
      _$PosSubUsersFromJson(json);
}

@JsonSerializable()
class PlansPricing {
  @JsonKey(name: "free")
  PlanFree planFree;
  @JsonKey(name: "gold")
  PlanGold planGold;
  @JsonKey(name: "diamond")
  PlanDiamond planDiamond;
  @JsonKey(name: "enterprice")
  PlanEnterprice planEnterprice;
  PlansPricing(
      {this.planDiamond, this.planEnterprice, this.planFree, this.planGold});
  factory PlansPricing.fromJson(Map<String, dynamic> json) =>
      _$PlansPricingFromJson(json);
}

@JsonSerializable()
class PlanFree {
  String button;
  PlanFree({this.button});
  factory PlanFree.fromJson(Map<String, dynamic> json) =>
      _$PlanFreeFromJson(json);
}

@JsonSerializable()
class PlanGold {
  @JsonKey(name: "1_month")
  GoldPlan1month goldplan1month;
  @JsonKey(name: "3_months")
  GoldPlan3Month goldplan3month;
  @JsonKey(name: "6_months")
  GoldPlan6Month goldplan6month;
  @JsonKey(name: "12_months")
  GoldPlan12Month goldplan12month;
  PlanGold(
      {this.goldplan12month,
      this.goldplan1month,
      this.goldplan3month,
      this.goldplan6month});
  factory PlanGold.fromJson(Map<String, dynamic> json) =>
      _$PlanGoldFromJson(json);
}

@JsonSerializable()
class GoldPlan1month {
  @JsonKey(name: "price_name")
  String priceName;
  double price;
  String currency;
  @JsonKey(name: "discount_percentage")
  int discountPercentage;
  GoldPlan1month(
      {this.currency, this.discountPercentage, this.price, this.priceName});
  factory GoldPlan1month.fromJson(Map<String, dynamic> json) =>
      _$GoldPlan1monthFromJson(json);
}

@JsonSerializable()
class GoldPlan3Month {
  @JsonKey(name: "price_name")
  String priceName;
  double price;
  String currency;
  @JsonKey(name: "discount_percentage")
  int discountPercentage;
  GoldPlan3Month(
      {this.currency, this.discountPercentage, this.price, this.priceName});
  factory GoldPlan3Month.fromJson(Map<String, dynamic> json) =>
      _$GoldPlan3MonthFromJson(json);
}

@JsonSerializable()
class GoldPlan6Month {
  @JsonKey(name: "price_name")
  String priceName;
  double price;
  String currency;
  @JsonKey(name: "discount_percentage")
  int discountPercentage;
  GoldPlan6Month(
      {this.currency, this.discountPercentage, this.price, this.priceName});
  factory GoldPlan6Month.fromJson(Map<String, dynamic> json) =>
      _$GoldPlan6MonthFromJson(json);
}

@JsonSerializable()
class GoldPlan12Month {
  @JsonKey(name: "price_name")
  String priceName;
  double price;
  String currency;
  @JsonKey(name: "discount_percentage")
  int discountPercentage;
  GoldPlan12Month(
      {this.currency, this.discountPercentage, this.price, this.priceName});
  factory GoldPlan12Month.fromJson(Map<String, dynamic> json) =>
      _$GoldPlan12MonthFromJson(json);
}

@JsonSerializable()
class PlanDiamond {
  @JsonKey(name: "1_month")
  DiamondPlan1month diamondplan1month;
  @JsonKey(name: "3_months")
  DiamondPlan3Month diamondplan3month;
  @JsonKey(name: "6_months")
  DiamondPlan6Month diamondplan6month;
  @JsonKey(name: "12_months")
  DiamondPlan12Month diamondplan12month;
  PlanDiamond(
      {this.diamondplan12month,
      this.diamondplan1month,
      this.diamondplan3month,
      this.diamondplan6month});
  factory PlanDiamond.fromJson(Map<String, dynamic> json) =>
      _$PlanDiamondFromJson(json);
}

@JsonSerializable()
class DiamondPlan1month {
  @JsonKey(name: "price_name")
  String priceName;
  double price;
  String currency;
  @JsonKey(name: "discount_percentage")
  int discountPercentage;
  DiamondPlan1month(
      {this.currency, this.discountPercentage, this.price, this.priceName});
  factory DiamondPlan1month.fromJson(Map<String, dynamic> json) =>
      _$DiamondPlan1monthFromJson(json);
}

@JsonSerializable()
class DiamondPlan3Month {
  @JsonKey(name: "price_name")
  String priceName;
  double price;
  String currency;
  @JsonKey(name: "discount_percentage")
  int discountPercentage;
  DiamondPlan3Month(
      {this.currency, this.discountPercentage, this.price, this.priceName});
  factory DiamondPlan3Month.fromJson(Map<String, dynamic> json) =>
      _$DiamondPlan3MonthFromJson(json);
}

@JsonSerializable()
class DiamondPlan6Month {
  @JsonKey(name: "price_name")
  String priceName;
  double price;
  String currency;
  @JsonKey(name: "discount_percentage")
  int discountPercentage;
  DiamondPlan6Month(
      {this.currency, this.discountPercentage, this.price, this.priceName});
  factory DiamondPlan6Month.fromJson(Map<String, dynamic> json) =>
      _$DiamondPlan6MonthFromJson(json);
}

@JsonSerializable()
class DiamondPlan12Month {
  @JsonKey(name: "price_name")
  String priceName;
  double price;
  String currency;
  @JsonKey(name: "discount_percentage")
  int discountPercentage;
  DiamondPlan12Month(
      {this.currency, this.discountPercentage, this.price, this.priceName});
  factory DiamondPlan12Month.fromJson(Map<String, dynamic> json) =>
      _$DiamondPlan12MonthFromJson(json);
}

@JsonSerializable()
class PlanEnterprice {
  EnterpriceHref enterpriceHref;
  PlanEnterprice({this.enterpriceHref});
  factory PlanEnterprice.fromJson(Map<String, dynamic> json) =>
      _$PlanEnterpriceFromJson(json);
}

@JsonSerializable()
class EnterpriceHref {
  String name;
  String value;
  EnterpriceHref({this.name, this.value});
  factory EnterpriceHref.fromJson(Map<String, dynamic> json) =>
      _$EnterpriceHrefFromJson(json);
}

@JsonSerializable()
class PlansComparision {
  @JsonKey(name: "values")
  PlansValues plansValues;
  @JsonKey(name: "grouping_meta")
  List<PlansGroupingMeta> plansGroupingMeta;
  PlansComparision({this.plansValues, this.plansGroupingMeta});
  factory PlansComparision.fromJson(Map<String, dynamic> json) =>
      _$PlansComparisionFromJson(json);
}

@JsonSerializable()
class PlansGroupingMeta {
  String value;
  PlansGroupingMeta({this.value});
  factory PlansGroupingMeta.fromJson(Map<String, dynamic> json) =>
      _$PlansGroupingMetaFromJson(json);
}

@JsonSerializable()
class PlansValues {
  @JsonKey(name: "ecommerce")
  List<PlansEcommerce> plansEcommerce;
  @JsonKey(name: "logistics")
  List<PlansLogistics> plansLogistics;
  @JsonKey(name: "pos")
  List<PlansPos> plansPos;
  @JsonKey(name: "support")
  List<PlansSupport> plansSupport;
  @JsonKey(name: "extra_features")
  List<PlansExtraFeatures> plansExtraFeatures;
  PlansValues(
      {this.plansEcommerce,
      this.plansExtraFeatures,
      this.plansLogistics,
      this.plansPos,
      this.plansSupport});
  factory PlansValues.fromJson(Map<String, dynamic> json) =>
      _$PlansValuesFromJson(json);
}

@JsonSerializable()
class PlansEcommerce {
  @JsonKey(name: "event_name")
  String eventName;
  @JsonKey(name: "value_list")
  List<EccomerceValueList> eccomerceValueList;
  PlansEcommerce({this.eccomerceValueList, this.eventName});
  factory PlansEcommerce.fromJson(Map<String, dynamic> json) =>
      _$PlansEcommerceFromJson(json);
}

@JsonSerializable()
class EccomerceValueList {
  String key;
  @JsonKey(name: "is_valid")
  int isValid;
  EccomerceValueList({this.isValid, this.key});
  factory EccomerceValueList.fromJson(Map<String, dynamic> json) =>
      _$EccomerceValueListFromJson(json);
}

@JsonSerializable()
class PlansLogistics {
  @JsonKey(name: "event_name")
  String eventName;
  @JsonKey(name: "value_list")
  List<LogisticsValueList> logisticsValueList;
  PlansLogistics({this.logisticsValueList, this.eventName});
  factory PlansLogistics.fromJson(Map<String, dynamic> json) =>
      _$PlansLogisticsFromJson(json);
}

@JsonSerializable()
class LogisticsValueList {
  String key;
  @JsonKey(name: "is_valid")
  int isValid;
  LogisticsValueList({this.isValid, this.key});
  factory LogisticsValueList.fromJson(Map<String, dynamic> json) =>
      _$LogisticsValueListFromJson(json);
}

@JsonSerializable()
class PlansPos {
  @JsonKey(name: "event_name")
  String eventName;
  @JsonKey(name: "value_list")
  List<PosValueList> posValueList;
  PlansPos({this.posValueList, this.eventName});
  factory PlansPos.fromJson(Map<String, dynamic> json) =>
      _$PlansPosFromJson(json);
}

@JsonSerializable()
class PosValueList {
  String key;
  @JsonKey(name: "is_valid")
  int isValid;
  PosValueList({this.isValid, this.key});
  factory PosValueList.fromJson(Map<String, dynamic> json) =>
      _$PosValueListFromJson(json);
}

@JsonSerializable()
class PlansSupport {
  @JsonKey(name: "event_name")
  String eventName;
  @JsonKey(name: "value_list")
  List<SupportValueList> supportValueList;
  PlansSupport({this.supportValueList, this.eventName});
  factory PlansSupport.fromJson(Map<String, dynamic> json) =>
      _$PlansSupportFromJson(json);
}

@JsonSerializable()
class SupportValueList {
  String key;
  @JsonKey(name: "is_valid")
  int isValid;
  SupportValueList({this.isValid, this.key});
  factory SupportValueList.fromJson(Map<String, dynamic> json) =>
      _$SupportValueListFromJson(json);
}

@JsonSerializable()
class PlansExtraFeatures {
  @JsonKey(name: "event_name")
  String eventName;
  @JsonKey(name: "value_list")
  List<ExtraFeaturesValueList> extraFeaturesValueList;
  PlansExtraFeatures({this.extraFeaturesValueList, this.eventName});
  factory PlansExtraFeatures.fromJson(Map<String, dynamic> json) =>
      _$PlansExtraFeaturesFromJson(json);
}

@JsonSerializable()
class ExtraFeaturesValueList {
  String key;
  @JsonKey(name: "is_valid")
  int isValid;
  ExtraFeaturesValueList({this.isValid, this.key});
  factory ExtraFeaturesValueList.fromJson(Map<String, dynamic> json) =>
      _$ExtraFeaturesValueListFromJson(json);
}

//******************************** Tracking ********************************/
@JsonSerializable()
class TrackingLogisticsRes extends Base {
  bool status;
  bool isLoading;
  List<TrackingLogisticsData> data;
  TrackingLogisticsRes({this.data, this.isLoading, this.status});

  factory TrackingLogisticsRes.fromJson(Map<String, dynamic> json) =>
      _$TrackingLogisticsResFromJson(json);

  static TrackingLogisticsRes buildErr(int errcode, {String message}) {
    TrackingLogisticsRes resD = TrackingLogisticsRes();
    Base _b = resD.buildError(errcode, message: message);
//    res_d.message = _b.message;
//    res_d.status = _b.status;
//    res_d.is_loading = _b.is_loading;
    return resD
      ..message = _b.message
      ..status = _b.status
      ..is_loading = _b.is_loading;
  }
}

@JsonSerializable()
class TrackingLogisticsData {
  int id;
  String logo;
  String name;
  TrackingLogisticsData({this.id, this.logo, this.name});

  factory TrackingLogisticsData.fromJson(Map<String, dynamic> json) =>
      _$TrackingLogisticsDataFromJson(json);
}

//******************************** Own Logistics ********************************/
@JsonSerializable()
class OwnLogisticsRes extends Base {
  bool status;
  bool isLoading;
  List<OwnLogisticsData> data;
  OwnLogisticsRes({this.data, this.isLoading, this.status});

  factory OwnLogisticsRes.fromJson(Map<String, dynamic> json) =>
      _$OwnLogisticsResFromJson(json);

  static OwnLogisticsRes buildErr(int errcode, {String message}) {
    OwnLogisticsRes resD = OwnLogisticsRes();
    Base _b = resD.buildError(errcode, message: message);
//    res_d.message = _b.message;
//    res_d.status = _b.status;
//    res_d.is_loading = _b.is_loading;
    return resD
      ..message = _b.message
      ..status = _b.status
      ..is_loading = _b.is_loading;
  }
}

@JsonSerializable()
class OwnLogisticsData {
  int id;
  String logo;
  String name;
  OwnLogisticsData({this.id, this.logo, this.name});

  factory OwnLogisticsData.fromJson(Map<String, dynamic> json) =>
      _$OwnLogisticsDataFromJson(json);
}

//******************************** Own logistics Submit ********************************/
@JsonSerializable()
class OwnLogisticsSubmitRes extends Base {
  bool status;
  bool isLoading;
  String message;
  List<OwnLogisticsSubmitData> data;
  OwnLogisticsSubmitRes({this.data, this.isLoading, this.message, this.status});
  factory OwnLogisticsSubmitRes.fromJson(Map<String, dynamic> json) =>
      _$OwnLogisticsSubmitResFromJson(json);

  static OwnLogisticsSubmitRes buildErr(int errcode, {String message}) {
    OwnLogisticsSubmitRes resD = OwnLogisticsSubmitRes();
    Base _b = resD.buildError(errcode, message: message);
//    res_d.message = _b.message;
//    res_d.status = _b.status;
//    res_d.is_loading = _b.is_loading;
    return resD
      ..message = _b.message
      ..status = _b.status
      ..is_loading = _b.is_loading;
  }
}

@JsonSerializable()
class OwnLogisticsSubmitData {
  @JsonKey(name: "event_id")
  String eventId;
  @JsonKey(name: "request_id")
  String requestId;
  OwnLogisticsSubmitData({this.eventId, this.requestId});
  factory OwnLogisticsSubmitData.fromJson(Map<String, dynamic> json) =>
      _$OwnLogisticsSubmitDataFromJson(json);
}

//******************************** order cancellation  ********************************/
@JsonSerializable()
class OrderCancellationRes extends Base {
  bool status;
  bool isLoading;
  String message;
  List<OrderCancellationSubmitData> data;
  OrderCancellationRes({this.data, this.isLoading, this.message, this.status});
  factory OrderCancellationRes.fromJson(Map<String, dynamic> json) =>
      _$OrderCancellationResFromJson(json);

  static OrderCancellationRes buildErr(int errcode, {String message}) {
    OrderCancellationRes resD = OrderCancellationRes();
    Base _b = resD.buildError(errcode, message: message);
//    res_d.message = _b.message;
//    res_d.status = _b.status;
//    res_d.is_loading = _b.is_loading;
    return resD
      ..message = _b.message
      ..status = _b.status
      ..is_loading = _b.is_loading;
  }
}

@JsonSerializable()
class OrderCancellationSubmitData {
  @JsonKey(name: "event_id")
  String eventId;
  @JsonKey(name: "request_id")
  String requestId;
  OrderCancellationSubmitData({this.eventId, this.requestId});
  factory OrderCancellationSubmitData.fromJson(Map<String, dynamic> json) =>
      _$OrderCancellationSubmitDataFromJson(json);
}

//******************************** Payment ********************************/
@JsonSerializable()
class PaymentRes extends Base {
  bool status;
  bool isLoading;
  List<PaymentData> data;
  PaymentPagination pagination;
  PaymentRes({this.data, this.isLoading, this.status, this.pagination});
  factory PaymentRes.fromJson(Map<String, dynamic> json) =>
      _$PaymentResFromJson(json);

  static PaymentRes buildErr(int errcode, {String message}) {
    PaymentRes resD = PaymentRes();
    Base _b = resD.buildError(errcode, message: message);
//    res_d.message = _b.message;
//    res_d.status = _b.status;
//    res_d.is_loading = _b.is_loading;
    return resD
      ..message = _b.message
      ..status = _b.status
      ..is_loading = _b.is_loading;
  }
}

@JsonSerializable()
class PaymentData {
  @JsonKey(name: "channel_type")
  String channelType;
  @JsonKey(name: "order_id")
  String orderId;
  @JsonKey(name: "marketplace_id")
  String marketplaceId;
  @JsonKey(name: "purchase_date")
  String purchaseDate;
  @JsonKey(name: "status")
  String productStatus;
  @JsonKey(name: "currency_code")
  String currencyCode;
  @JsonKey(name: "product_info")
  List<PaymentProductInfo> productInfo;
  @JsonKey(name: "receiver_details")
  PaymentReceiverDetails receiverDetails;
  @JsonKey(name: "order_amount")
  double orderAmount;
  PaymentData(
      {this.channelType,
      this.orderId,
      this.productInfo,
      this.currencyCode,
      this.marketplaceId,
      this.productStatus,
      this.receiverDetails,
      this.purchaseDate,
      this.orderAmount});
  factory PaymentData.fromJson(Map<String, dynamic> json) =>
      _$PaymentDataFromJson(json);
}

@JsonSerializable()
class PaymentReceiverDetails {
  @JsonKey(name: "receiver_pin_code")
  String receiverPinCode;
  PaymentReceiverDetails({this.receiverPinCode});
  factory PaymentReceiverDetails.fromJson(Map<String, dynamic> json) =>
      _$PaymentReceiverDetailsFromJson(json);
}

@JsonSerializable()
class PaymentProductInfo {
  @JsonKey(name: "product_image_url")
  String productImageUrl;
  @JsonKey(name: "product_title")
  String productTitle;
  @JsonKey(name: "item_quantity")
  int itemQuantity;

  PaymentProductInfo(
      {this.itemQuantity, this.productImageUrl, this.productTitle});
  factory PaymentProductInfo.fromJson(Map<String, dynamic> json) =>
      _$PaymentProductInfoFromJson(json);
}

@JsonSerializable()
class PaymentPagination {
  @JsonKey(name: "total_pages")
  int totalPages;
  @JsonKey(name: "per_page")
  int perPage;
  @JsonKey(name: "current_page")
  String currentPage;
  @JsonKey(name: "next_page")
  int nextpage;
  @JsonKey(name: "previous_page")
  int previousPage;
  PaymentPagination(
      {this.currentPage,
      this.nextpage,
      this.perPage,
      this.previousPage,
      this.totalPages});

  factory PaymentPagination.fromJson(Map<String, dynamic> json) =>
      _$PaymentPaginationFromJson(json);
}

//******************************** SingleOrder ********************************/
@JsonSerializable()
class SingleOrderRes extends Base {
  bool status;
  bool isLoading;
  SingleOrderData data;
  SingleOrderRes({this.data, this.isLoading, this.status});
  factory SingleOrderRes.fromJson(Map<String, dynamic> json) =>
      _$SingleOrderResFromJson(json);

  static SingleOrderRes buildErr(int errcode, {String message}) {
    SingleOrderRes resD = SingleOrderRes();
    Base _b = resD.buildError(errcode, message: message);
//    res_d.message = _b.message;
//    res_d.status = _b.status;
//    res_d.is_loading = _b.is_loading;
    return resD
      ..message = _b.message
      ..status = _b.status
      ..is_loading = _b.is_loading;
  }
}

@JsonSerializable()
class SingleOrderData {
  @JsonKey(name: "receiver_details")
  OrderReceiverDetails receiverDetails;
  @JsonKey(name: "product_info")
  List<SingleorderProductInfo> productInfo;
  @JsonKey(name: "purchase_date")
  String purchaseDate;
  @JsonKey(name: "status")
  String orderStatus;
  @JsonKey(name: "currency_code")
  String currencyCode;
  @JsonKey(name: "order_amount")
  double orderAmount;

  SingleOrderData(
      {this.currencyCode,
      this.orderStatus,
      this.productInfo,
      this.purchaseDate,
      this.receiverDetails,
      this.orderAmount});
  factory SingleOrderData.fromJson(Map<String, dynamic> json) =>
      _$SingleOrderDataFromJson(json);
}

@JsonSerializable()
class OrderReceiverDetails {
  @JsonKey(name: "receiver_address_1")
  String receiverAddress1;
  @JsonKey(name: "receiver_city")
  String receiverCity;
  @JsonKey(name: "receiver_country")
  String receiverCountry;
  @JsonKey(name: "receiver_country_code")
  String receiverCountryCode;
  @JsonKey(name: "receiver_email_id")
  String receiverEmailId;
  @JsonKey(name: "receiver_name")
  String receiverName;
  @JsonKey(name: "receiver_pin_code")
  String receiverpinCode;
  @JsonKey(name: "receiver_state")
  String receiverstate;

  OrderReceiverDetails(
      {this.receiverAddress1,
      this.receiverCity,
      this.receiverCountry,
      this.receiverCountryCode,
      this.receiverEmailId,
      this.receiverName,
      this.receiverpinCode,
      this.receiverstate});
  factory OrderReceiverDetails.fromJson(Map<String, dynamic> json) =>
      _$OrderReceiverDetailsFromJson(json);
}

@JsonSerializable()
class SingleorderProductInfo {
  @JsonKey(name: "product_title")
  String productTitle;
  @JsonKey(name: "product_image_url")
  String productImageUrl;
  @JsonKey(name: "item_quantity")
  int itemQuantity;
  @JsonKey(name: "item_price")
  SingleItemPrice itemPrice;
  @JsonKey(name: "item_tax_percentages")
  SingleItemTaxPercentage itemTaxPercentage;

  SingleorderProductInfo(
      {this.itemPrice,
      this.itemQuantity,
      this.itemTaxPercentage,
      this.productImageUrl,
      this.productTitle});
  factory SingleorderProductInfo.fromJson(Map<String, dynamic> json) =>
      _$SingleorderProductInfoFromJson(json);
}

@JsonSerializable()
class SingleItemPrice {
  @JsonKey(name: "currency_code")
  String currencyCode;
  double amount;
  SingleItemPrice({this.amount, this.currencyCode});
  factory SingleItemPrice.fromJson(Map<String, dynamic> json) =>
      _$SingleItemPriceFromJson(json);
}

@JsonSerializable()
class SingleItemTaxPercentage {
  int sgst;
  int cgst;
  SingleItemTaxPercentage({this.cgst, this.sgst});
  factory SingleItemTaxPercentage.fromJson(Map<String, dynamic> json) =>
      _$SingleItemTaxPercentageFromJson(json);
}

//******************************** Paymentdetail ********************************/
@JsonSerializable()
class PaymentDetailRes extends Base {
  bool status;
  bool isLoading;
  List<PaymentDetailData> data;

  PaymentDetailRes({this.data, this.isLoading, this.status});
  factory PaymentDetailRes.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailResFromJson(json);

  static PaymentDetailRes buildErr(int errcode, {String message}) {
    PaymentDetailRes resD = PaymentDetailRes();
    Base _b = resD.buildError(errcode, message: message);
//    res_d.message = _b.message;
//    res_d.status = _b.status;
//    res_d.is_loading = _b.is_loading;
    return resD
      ..message = _b.message
      ..status = _b.status
      ..is_loading = _b.is_loading;
  }
}

@JsonSerializable()
class PaymentDetailData {
  @JsonKey(name: "marketplace_id")
  String marketplaceId;
  @JsonKey(name: "product_image_url")
  String productImage;
  @JsonKey(name: "item_quantity")
  int itemQuantity;
  @JsonKey(name: "seller_sku")
  String sellerSku;
  @JsonKey(name: "order_item_number")
  String orderItemNumber;
  @JsonKey(name: "item_price")
  PaymentItemPrice itemPrice;
  @JsonKey(name: "item_tax_percentages")
  PaymentTaxPercentage itemTaxPercentage;
  PaymentDetailData(
      {this.itemPrice,
      this.itemQuantity,
      this.itemTaxPercentage,
      this.marketplaceId,
      this.orderItemNumber,
      this.productImage,
      this.sellerSku});
  factory PaymentDetailData.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailDataFromJson(json);
}

@JsonSerializable()
class PaymentItemPrice {
  @JsonKey(name: "currency_code")
  String currencyCode;
  double amount;
  PaymentItemPrice({this.amount, this.currencyCode});
  factory PaymentItemPrice.fromJson(Map<String, dynamic> json) =>
      _$PaymentItemPriceFromJson(json);
}

@JsonSerializable()
class PaymentTaxPercentage {
  int cgst;
  int sgst;
  PaymentTaxPercentage({this.cgst, this.sgst});
  factory PaymentTaxPercentage.fromJson(Map<String, dynamic> json) =>
      _$PaymentTaxPercentageFromJson(json);
}
