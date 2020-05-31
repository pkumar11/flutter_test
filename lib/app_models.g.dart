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

SignupRes _$SignupResFromJson(Map<String, dynamic> json) {
  return SignupRes(
      name: json['name'] as String,
      loginData: json['data'] == null
          ? null
          : SignupData.fromJson(json['data'] as Map<String, dynamic>))
    ..status = json['status'] as bool
    ..message = json['message'] as String
    ..is_loading = json['is_loading'] as bool;
}

Map<String, dynamic> _$SignupResToJson(SignupRes instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'is_loading': instance.is_loading,
      'name': instance.name,
      'data': instance.loginData
    };

SignupData _$SignupDataFromJson(Map<String, dynamic> json) {
  return SignupData(
      userId: json['user_id'] as String,
      accountId: json['account_id'] as String,
      token: json['token'] as String);
}

Map<String, dynamic> _$SignupDataToJson(SignupData instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'account_id': instance.accountId,
      'token': instance.token
    };

ProfileRes _$ProfileResFromJson(Map<String, dynamic> json) {
  return ProfileRes(
      status: json['status'] as bool,
      data: json['data'] == null
          ? null
          : ProfileData.fromJson(json['data'] as Map<String, dynamic>))
    ..message = json['message'] as String
    ..is_loading = json['is_loading'] as bool;
}

Map<String, dynamic> _$ProfileResToJson(ProfileRes instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'is_loading': instance.is_loading,
      'data': instance.data
    };

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) {
  return ProfileData(
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      gender: json['gender'] as String,
      designation: json['designation'] as String,
      profile_picture: json['profile_picture'] as String,
      date_of_birth: json['date_of_birth'] as String);
}

Map<String, dynamic> _$ProfileDataToJson(ProfileData instance) =>
    <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'gender': instance.gender,
      'designation': instance.designation,
      'profile_picture': instance.profile_picture,
      'date_of_birth': instance.date_of_birth
    };

PlanningRes _$PlanningResFromJson(Map<String, dynamic> json) {
  return PlanningRes(
      status: json['status'] as bool,
      data: (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : PlanningLogisticsData.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      is_loading: json['is_loading'] as bool)
    ..message = json['message'] as String;
}

Map<String, dynamic> _$PlanningResToJson(PlanningRes instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'is_loading': instance.is_loading,
      'data': instance.data
    };

PlanningLogisticsData _$PlanningLogisticsDataFromJson(
    Map<String, dynamic> json) {
  return PlanningLogisticsData(
      from: json['from'] as String,
      to: json['to'] as String,
      length: (json['length'] as num)?.toDouble(),
      width: (json['width'] as num)?.toDouble(),
      height: (json['height'] as num)?.toDouble(),
      weight: (json['weight'] as num)?.toDouble(),
      volumetricWeight: (json['volumetric_weight'] as num)?.toDouble(),
      weightConsidered: (json['weight_considered'] as num)?.toDouble(),
      price: (json['price'] as num)?.toDouble(),
      shippingPartnerId: json['shipping_partner_id'] as String,
      carrier: json['carrier'] as String,
      shipmentType: json['shipment_type'] as String,
      carrierLogo: json['carrier_logo'] as String,
      timeline: json['timeline'] as String,
      currency: json['currency'] as String);
}

Map<String, dynamic> _$PlanningLogisticsDataToJson(
        PlanningLogisticsData instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
      'weight': instance.weight,
      'volumetric_weight': instance.volumetricWeight,
      'weight_considered': instance.weightConsidered,
      'price': instance.price,
      'shipping_partner_id': instance.shippingPartnerId,
      'carrier': instance.carrier,
      'shipment_type': instance.shipmentType,
      'carrier_logo': instance.carrierLogo,
      'timeline': instance.timeline,
      'currency': instance.currency
    };

ListWarehouseAddressRes _$ListWarehouseAddressResFromJson(
    Map<String, dynamic> json) {
  return ListWarehouseAddressRes(
      status: json['status'] as bool,
      data: (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : ListWarehouseAddressData.fromJson(e as Map<String, dynamic>))
          ?.toList())
    ..message = json['message'] as String
    ..is_loading = json['is_loading'] as bool;
}

Map<String, dynamic> _$ListWarehouseAddressResToJson(
        ListWarehouseAddressRes instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'is_loading': instance.is_loading,
      'data': instance.data
    };

ListWarehouseAddressData _$ListWarehouseAddressDataFromJson(
    Map<String, dynamic> json) {
  return ListWarehouseAddressData(
      id: json['id'] as String,
      account_id: json['_id'] as String,
      address_name: json['address_name'] as String,
      origin_country: json['origin_country'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address_1: json['address_1'] as String,
      address_2: json['address_2'] as String,
      postal_code: json['postal_code'] as String,
      created_by: json['created_by'] as String,
      address_id: json['address_id'] as String);
}

Map<String, dynamic> _$ListWarehouseAddressDataToJson(
        ListWarehouseAddressData instance) =>
    <String, dynamic>{
      'id': instance.id,
      '_id': instance.account_id,
      'address_name': instance.address_name,
      'origin_country': instance.origin_country,
      'state': instance.state,
      'city': instance.city,
      'email': instance.email,
      'phone': instance.phone,
      'address_1': instance.address_1,
      'address_2': instance.address_2,
      'postal_code': instance.postal_code,
      'created_by': instance.created_by,
      'address_id': instance.address_id
    };

OrderRes _$OrderResFromJson(Map<String, dynamic> json) {
  return OrderRes(
      status: json['status'] as bool,
      is_loading: json['is_loading'] as bool,
      data: (json['data'] as List)
          ?.map((e) =>
              e == null ? null : OrderData.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      pagination: json['pagination'] == null
          ? null
          : OrderPagination.fromJson(
              json['pagination'] as Map<String, dynamic>))
    ..message = json['message'] as String;
}

Map<String, dynamic> _$OrderResToJson(OrderRes instance) => <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'is_loading': instance.is_loading,
      'data': instance.data,
      'pagination': instance.pagination
    };

OrderData _$OrderDataFromJson(Map<String, dynamic> json) {
  return OrderData(
      channelId: json['channel_id'] as String,
      orderId: json['order_id'] as String,
      channelType: json['channel_type'] as String,
      currencyCode: json['currency_code'] as String,
      orderAmount: (json['order_amount'] as num)?.toDouble(),
      purchaseDate: json['purchase_date'] as String,
      productInfo: (json['product_info'] as List)
          ?.map((e) => e == null
              ? null
              : OrderProductInfo.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      skuId: (json['sku_ids'] as List)?.map((e) => e as String)?.toList(),
      orderItemNumber:
          (json['order_item_numbers'] as List)?.map((e) => e as int)?.toList());
}

Map<String, dynamic> _$OrderDataToJson(OrderData instance) => <String, dynamic>{
      'channel_id': instance.channelId,
      'order_id': instance.orderId,
      'channel_type': instance.channelType,
      'currency_code': instance.currencyCode,
      'order_amount': instance.orderAmount,
      'purchase_date': instance.purchaseDate,
      'product_info': instance.productInfo,
      'sku_ids': instance.skuId,
      'order_item_numbers': instance.orderItemNumber
    };

OrderProductInfo _$OrderProductInfoFromJson(Map<String, dynamic> json) {
  return OrderProductInfo(
      productTitle: json['product_title'] as String,
      itemQuantity: json['item_quantity'] as int,
      marketplaceId: json['marketplace_id'] as String);
}

Map<String, dynamic> _$OrderProductInfoToJson(OrderProductInfo instance) =>
    <String, dynamic>{
      'product_title': instance.productTitle,
      'item_quantity': instance.itemQuantity,
      'marketplace_id': instance.marketplaceId
    };

OrderPagination _$OrderPaginationFromJson(Map<String, dynamic> json) {
  return OrderPagination(
      currentPage: json['current_page'] as int,
      nextpage: json['next_page'] as int,
      perPage: json['per_page'] as int,
      previousPage: json['previous_page'] as int,
      totalPages: json['total_pages'] as int);
}

Map<String, dynamic> _$OrderPaginationToJson(OrderPagination instance) =>
    <String, dynamic>{
      'total_pages': instance.totalPages,
      'per_page': instance.perPage,
      'current_page': instance.currentPage,
      'next_page': instance.nextpage,
      'previous_page': instance.previousPage
    };

OrderSearchRes _$OrderSearchResFromJson(Map<String, dynamic> json) {
  return OrderSearchRes(
      status: json['status'] as bool,
      isLoading: json['isLoading'] as bool,
      data: (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : OrderSearchData.fromJson(e as Map<String, dynamic>))
          ?.toList())
    ..message = json['message'] as String
    ..is_loading = json['is_loading'] as bool;
}

Map<String, dynamic> _$OrderSearchResToJson(OrderSearchRes instance) =>
    <String, dynamic>{
      'message': instance.message,
      'is_loading': instance.is_loading,
      'status': instance.status,
      'isLoading': instance.isLoading,
      'data': instance.data
    };

OrderSearchData _$OrderSearchDataFromJson(Map<String, dynamic> json) {
  return OrderSearchData(
      channelId: json['channel_id'] as String,
      orderId: json['order_id'] as String,
      channelType: json['channel_type'] as String,
      currencyCode: json['currency_code'] as String,
      orderAmount: (json['order_amount'] as num)?.toDouble(),
      purchaseDate: json['purchase_date'] as String,
      productInfo: (json['product_info'] as List)
          ?.map((e) => e == null
              ? null
              : OrderSearchProductInfo.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      skuId: (json['sku_ids'] as List)?.map((e) => e as String)?.toList(),
      orderItemNumber:
          (json['order_item_numbers'] as List)?.map((e) => e as int)?.toList());
}

Map<String, dynamic> _$OrderSearchDataToJson(OrderSearchData instance) =>
    <String, dynamic>{
      'channel_id': instance.channelId,
      'order_id': instance.orderId,
      'channel_type': instance.channelType,
      'currency_code': instance.currencyCode,
      'order_amount': instance.orderAmount,
      'purchase_date': instance.purchaseDate,
      'product_info': instance.productInfo,
      'sku_ids': instance.skuId,
      'order_item_numbers': instance.orderItemNumber
    };

OrderSearchProductInfo _$OrderSearchProductInfoFromJson(
    Map<String, dynamic> json) {
  return OrderSearchProductInfo(
      productTitle: json['product_title'] as String,
      itemQuantity: json['item_quantity'] as int,
      marketplaceId: json['marketplace_id'] as String);
}

Map<String, dynamic> _$OrderSearchProductInfoToJson(
        OrderSearchProductInfo instance) =>
    <String, dynamic>{
      'product_title': instance.productTitle,
      'item_quantity': instance.itemQuantity,
      'marketplace_id': instance.marketplaceId
    };

KycRes _$KycResFromJson(Map<String, dynamic> json) {
  return KycRes(
      status: json['status'] as bool,
      data: json['data'] == null
          ? null
          : KycData.fromJson(json['data'] as Map<String, dynamic>))
    ..message = json['message'] as String
    ..is_loading = json['is_loading'] as bool
    ..isLoading = json['isLoading'] as bool;
}

Map<String, dynamic> _$KycResToJson(KycRes instance) => <String, dynamic>{
      'message': instance.message,
      'is_loading': instance.is_loading,
      'status': instance.status,
      'isLoading': instance.isLoading,
      'data': instance.data
    };

KycData _$KycDataFromJson(Map<String, dynamic> json) {
  return KycData(
      aadharCardFile: json['aadhar_card_file'] as String,
      aadharCardNumber: json['aadhar_card_number'] as String,
      bussinessRegistration: json['bussiness_registration'] as String,
      bussinessRegistrationFile: json['bussiness_registration_file'] as String,
      gstinFile: json['gstin_file'] as String,
      gstinNumber: json['gstin_number'] as String,
      iecFile: json['iec_file'] as String,
      iecNumber: json['iec_number'] as String,
      pancardFile: json['pancard_file'] as String,
      pancardNumber: json['pancard_number'] as String,
      passportFile: json['passport_file'] as String,
      passportNumber: json['passport_number'] as String,
      voterIdNumber: json['voter_id_number'] as String,
      voterIdNumberFile: json['voter_id_file'] as String);
}

Map<String, dynamic> _$KycDataToJson(KycData instance) => <String, dynamic>{
      'aadhar_card_number': instance.aadharCardNumber,
      'aadhar_card_file': instance.aadharCardFile,
      'passport_file': instance.passportFile,
      'passport_number': instance.passportNumber,
      'bussiness_registration': instance.bussinessRegistration,
      'bussiness_registration_file': instance.bussinessRegistrationFile,
      'iec_number': instance.iecNumber,
      'iec_file': instance.iecFile,
      'gstin_file': instance.gstinFile,
      'gstin_number': instance.gstinNumber,
      'voter_id_number': instance.voterIdNumber,
      'voter_id_file': instance.voterIdNumberFile,
      'pancard_number': instance.pancardNumber,
      'pancard_file': instance.pancardFile
    };

PlansRes _$PlansResFromJson(Map<String, dynamic> json) {
  return PlansRes(
      status: json['status'] as bool,
      isLoading: json['isLoading'] as bool,
      data: json['data'] == null
          ? null
          : PlansData.fromJson(json['data'] as Map<String, dynamic>))
    ..message = json['message'] as String
    ..is_loading = json['is_loading'] as bool;
}

Map<String, dynamic> _$PlansResToJson(PlansRes instance) => <String, dynamic>{
      'message': instance.message,
      'is_loading': instance.is_loading,
      'status': instance.status,
      'isLoading': instance.isLoading,
      'data': instance.data
    };

PlansData _$PlansDataFromJson(Map<String, dynamic> json) {
  return PlansData(
      plans: (json['plans'] as List)
          ?.map((e) =>
              e == null ? null : Plans.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      plansPricing: json['plan_pricing'] == null
          ? null
          : PlansPricing.fromJson(json['plan_pricing'] as Map<String, dynamic>),
      plansComparision: json['plan_comparision'] == null
          ? null
          : PlansComparision.fromJson(
              json['plan_comparision'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PlansDataToJson(PlansData instance) => <String, dynamic>{
      'plans': instance.plans,
      'plan_pricing': instance.plansPricing,
      'plan_comparision': instance.plansComparision
    };

Plans _$PlansFromJson(Map<String, dynamic> json) {
  return Plans(
      planDetails: json['plan_details'] == null
          ? null
          : PlanDetails.fromJson(json['plan_details'] as Map<String, dynamic>),
      planLimits: json['plan_limits'] == null
          ? null
          : PlanLimits.fromJson(json['plan_limits'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PlansToJson(Plans instance) => <String, dynamic>{
      'plan_details': instance.planDetails,
      'plan_limits': instance.planLimits
    };

PlanDetails _$PlanDetailsFromJson(Map<String, dynamic> json) {
  return PlanDetails(
      planName: json['plan_name'] as String,
      planDescription: json['plan_description'] as String,
      planKey: json['plan_key'] as String);
}

Map<String, dynamic> _$PlanDetailsToJson(PlanDetails instance) =>
    <String, dynamic>{
      'plan_name': instance.planName,
      'plan_key': instance.planKey,
      'plan_description': instance.planDescription
    };

PlanLimits _$PlanLimitsFromJson(Map<String, dynamic> json) {
  return PlanLimits(
      marketchannels: json['marketchannels'] == null
          ? null
          : Marketchannels.fromJson(
              json['marketchannels'] as Map<String, dynamic>),
      orders: json['orders'] == null
          ? null
          : Orders.fromJson(json['orders'] as Map<String, dynamic>),
      posStores: json['pos_stores'] == null
          ? null
          : PosStores.fromJson(json['pos_stores'] as Map<String, dynamic>),
      posSubUsers: json['pos_sub_users'] == null
          ? null
          : PosSubUsers.fromJson(json['pos_sub_users'] as Map<String, dynamic>),
      shippingPartners: json['shipping_partners'] == null
          ? null
          : ShippingPartners.fromJson(
              json['shipping_partners'] as Map<String, dynamic>),
      skuId: json['sku_ids'] == null
          ? null
          : SkuId.fromJson(json['sku_ids'] as Map<String, dynamic>),
      subUsers: json['sub_users'] == null
          ? null
          : SubUsers.fromJson(json['sub_users'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PlanLimitsToJson(PlanLimits instance) =>
    <String, dynamic>{
      'sku_ids': instance.skuId,
      'orders': instance.orders,
      'marketchannels': instance.marketchannels,
      'shipping_partners': instance.shippingPartners,
      'pos_stores': instance.posStores,
      'sub_users': instance.subUsers,
      'pos_sub_users': instance.posSubUsers
    };

SkuId _$SkuIdFromJson(Map<String, dynamic> json) {
  return SkuId(
      limitAllowed: json['limit_allowed'] as String,
      limitName: json['limit_name'] as String);
}

Map<String, dynamic> _$SkuIdToJson(SkuId instance) => <String, dynamic>{
      'limit_name': instance.limitName,
      'limit_allowed': instance.limitAllowed
    };

Orders _$OrdersFromJson(Map<String, dynamic> json) {
  return Orders(
      limitAllowed: json['limit_allowed'] as String,
      limitName: json['limit_name'] as String);
}

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
      'limit_name': instance.limitName,
      'limit_allowed': instance.limitAllowed
    };

Marketchannels _$MarketchannelsFromJson(Map<String, dynamic> json) {
  return Marketchannels(
      limitAllowed: json['limit_allowed'] as String,
      limitName: json['limit_name'] as String);
}

Map<String, dynamic> _$MarketchannelsToJson(Marketchannels instance) =>
    <String, dynamic>{
      'limit_name': instance.limitName,
      'limit_allowed': instance.limitAllowed
    };

ShippingPartners _$ShippingPartnersFromJson(Map<String, dynamic> json) {
  return ShippingPartners(
      limitAllowed: json['limit_allowed'] as String,
      limitName: json['limit_name'] as String);
}

Map<String, dynamic> _$ShippingPartnersToJson(ShippingPartners instance) =>
    <String, dynamic>{
      'limit_name': instance.limitName,
      'limit_allowed': instance.limitAllowed
    };

PosStores _$PosStoresFromJson(Map<String, dynamic> json) {
  return PosStores(
      limitAllowed: json['limit_allowed'] as String,
      limitName: json['limit_name'] as String);
}

Map<String, dynamic> _$PosStoresToJson(PosStores instance) => <String, dynamic>{
      'limit_name': instance.limitName,
      'limit_allowed': instance.limitAllowed
    };

SubUsers _$SubUsersFromJson(Map<String, dynamic> json) {
  return SubUsers(
      limitAllowed: json['limit_allowed'] as String,
      limitName: json['limit_name'] as String);
}

Map<String, dynamic> _$SubUsersToJson(SubUsers instance) => <String, dynamic>{
      'limit_name': instance.limitName,
      'limit_allowed': instance.limitAllowed
    };

PosSubUsers _$PosSubUsersFromJson(Map<String, dynamic> json) {
  return PosSubUsers(
      limitAllowed: json['limit_allowed'] as String,
      limitName: json['limit_name'] as String);
}

Map<String, dynamic> _$PosSubUsersToJson(PosSubUsers instance) =>
    <String, dynamic>{
      'limit_name': instance.limitName,
      'limit_allowed': instance.limitAllowed
    };

PlansPricing _$PlansPricingFromJson(Map<String, dynamic> json) {
  return PlansPricing(
      planDiamond: json['diamond'] == null
          ? null
          : PlanDiamond.fromJson(json['diamond'] as Map<String, dynamic>),
      planEnterprice: json['enterprice'] == null
          ? null
          : PlanEnterprice.fromJson(json['enterprice'] as Map<String, dynamic>),
      planFree: json['free'] == null
          ? null
          : PlanFree.fromJson(json['free'] as Map<String, dynamic>),
      planGold: json['gold'] == null
          ? null
          : PlanGold.fromJson(json['gold'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PlansPricingToJson(PlansPricing instance) =>
    <String, dynamic>{
      'free': instance.planFree,
      'gold': instance.planGold,
      'diamond': instance.planDiamond,
      'enterprice': instance.planEnterprice
    };

PlanFree _$PlanFreeFromJson(Map<String, dynamic> json) {
  return PlanFree(button: json['button'] as String);
}

Map<String, dynamic> _$PlanFreeToJson(PlanFree instance) =>
    <String, dynamic>{'button': instance.button};

PlanGold _$PlanGoldFromJson(Map<String, dynamic> json) {
  return PlanGold(
      goldplan12month: json['12_months'] == null
          ? null
          : GoldPlan12Month.fromJson(json['12_months'] as Map<String, dynamic>),
      goldplan1month: json['1_month'] == null
          ? null
          : GoldPlan1month.fromJson(json['1_month'] as Map<String, dynamic>),
      goldplan3month: json['3_months'] == null
          ? null
          : GoldPlan3Month.fromJson(json['3_months'] as Map<String, dynamic>),
      goldplan6month: json['6_months'] == null
          ? null
          : GoldPlan6Month.fromJson(json['6_months'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PlanGoldToJson(PlanGold instance) => <String, dynamic>{
      '1_month': instance.goldplan1month,
      '3_months': instance.goldplan3month,
      '6_months': instance.goldplan6month,
      '12_months': instance.goldplan12month
    };

GoldPlan1month _$GoldPlan1monthFromJson(Map<String, dynamic> json) {
  return GoldPlan1month(
      currency: json['currency'] as String,
      discountPercentage: json['discount_percentage'] as int,
      price: (json['price'] as num)?.toDouble(),
      priceName: json['price_name'] as String);
}

Map<String, dynamic> _$GoldPlan1monthToJson(GoldPlan1month instance) =>
    <String, dynamic>{
      'price_name': instance.priceName,
      'price': instance.price,
      'currency': instance.currency,
      'discount_percentage': instance.discountPercentage
    };

GoldPlan3Month _$GoldPlan3MonthFromJson(Map<String, dynamic> json) {
  return GoldPlan3Month(
      currency: json['currency'] as String,
      discountPercentage: json['discount_percentage'] as int,
      price: (json['price'] as num)?.toDouble(),
      priceName: json['price_name'] as String);
}

Map<String, dynamic> _$GoldPlan3MonthToJson(GoldPlan3Month instance) =>
    <String, dynamic>{
      'price_name': instance.priceName,
      'price': instance.price,
      'currency': instance.currency,
      'discount_percentage': instance.discountPercentage
    };

GoldPlan6Month _$GoldPlan6MonthFromJson(Map<String, dynamic> json) {
  return GoldPlan6Month(
      currency: json['currency'] as String,
      discountPercentage: json['discount_percentage'] as int,
      price: (json['price'] as num)?.toDouble(),
      priceName: json['price_name'] as String);
}

Map<String, dynamic> _$GoldPlan6MonthToJson(GoldPlan6Month instance) =>
    <String, dynamic>{
      'price_name': instance.priceName,
      'price': instance.price,
      'currency': instance.currency,
      'discount_percentage': instance.discountPercentage
    };

GoldPlan12Month _$GoldPlan12MonthFromJson(Map<String, dynamic> json) {
  return GoldPlan12Month(
      currency: json['currency'] as String,
      discountPercentage: json['discount_percentage'] as int,
      price: (json['price'] as num)?.toDouble(),
      priceName: json['price_name'] as String);
}

Map<String, dynamic> _$GoldPlan12MonthToJson(GoldPlan12Month instance) =>
    <String, dynamic>{
      'price_name': instance.priceName,
      'price': instance.price,
      'currency': instance.currency,
      'discount_percentage': instance.discountPercentage
    };

PlanDiamond _$PlanDiamondFromJson(Map<String, dynamic> json) {
  return PlanDiamond(
      diamondplan12month: json['12_months'] == null
          ? null
          : DiamondPlan12Month.fromJson(
              json['12_months'] as Map<String, dynamic>),
      diamondplan1month: json['1_month'] == null
          ? null
          : DiamondPlan1month.fromJson(json['1_month'] as Map<String, dynamic>),
      diamondplan3month: json['3_months'] == null
          ? null
          : DiamondPlan3Month.fromJson(
              json['3_months'] as Map<String, dynamic>),
      diamondplan6month: json['6_months'] == null
          ? null
          : DiamondPlan6Month.fromJson(
              json['6_months'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PlanDiamondToJson(PlanDiamond instance) =>
    <String, dynamic>{
      '1_month': instance.diamondplan1month,
      '3_months': instance.diamondplan3month,
      '6_months': instance.diamondplan6month,
      '12_months': instance.diamondplan12month
    };

DiamondPlan1month _$DiamondPlan1monthFromJson(Map<String, dynamic> json) {
  return DiamondPlan1month(
      currency: json['currency'] as String,
      discountPercentage: json['discount_percentage'] as int,
      price: (json['price'] as num)?.toDouble(),
      priceName: json['price_name'] as String);
}

Map<String, dynamic> _$DiamondPlan1monthToJson(DiamondPlan1month instance) =>
    <String, dynamic>{
      'price_name': instance.priceName,
      'price': instance.price,
      'currency': instance.currency,
      'discount_percentage': instance.discountPercentage
    };

DiamondPlan3Month _$DiamondPlan3MonthFromJson(Map<String, dynamic> json) {
  return DiamondPlan3Month(
      currency: json['currency'] as String,
      discountPercentage: json['discount_percentage'] as int,
      price: (json['price'] as num)?.toDouble(),
      priceName: json['price_name'] as String);
}

Map<String, dynamic> _$DiamondPlan3MonthToJson(DiamondPlan3Month instance) =>
    <String, dynamic>{
      'price_name': instance.priceName,
      'price': instance.price,
      'currency': instance.currency,
      'discount_percentage': instance.discountPercentage
    };

DiamondPlan6Month _$DiamondPlan6MonthFromJson(Map<String, dynamic> json) {
  return DiamondPlan6Month(
      currency: json['currency'] as String,
      discountPercentage: json['discount_percentage'] as int,
      price: (json['price'] as num)?.toDouble(),
      priceName: json['price_name'] as String);
}

Map<String, dynamic> _$DiamondPlan6MonthToJson(DiamondPlan6Month instance) =>
    <String, dynamic>{
      'price_name': instance.priceName,
      'price': instance.price,
      'currency': instance.currency,
      'discount_percentage': instance.discountPercentage
    };

DiamondPlan12Month _$DiamondPlan12MonthFromJson(Map<String, dynamic> json) {
  return DiamondPlan12Month(
      currency: json['currency'] as String,
      discountPercentage: json['discount_percentage'] as int,
      price: (json['price'] as num)?.toDouble(),
      priceName: json['price_name'] as String);
}

Map<String, dynamic> _$DiamondPlan12MonthToJson(DiamondPlan12Month instance) =>
    <String, dynamic>{
      'price_name': instance.priceName,
      'price': instance.price,
      'currency': instance.currency,
      'discount_percentage': instance.discountPercentage
    };

PlanEnterprice _$PlanEnterpriceFromJson(Map<String, dynamic> json) {
  return PlanEnterprice(
      enterpriceHref: json['enterpriceHref'] == null
          ? null
          : EnterpriceHref.fromJson(
              json['enterpriceHref'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PlanEnterpriceToJson(PlanEnterprice instance) =>
    <String, dynamic>{'enterpriceHref': instance.enterpriceHref};

EnterpriceHref _$EnterpriceHrefFromJson(Map<String, dynamic> json) {
  return EnterpriceHref(
      name: json['name'] as String, value: json['value'] as String);
}

Map<String, dynamic> _$EnterpriceHrefToJson(EnterpriceHref instance) =>
    <String, dynamic>{'name': instance.name, 'value': instance.value};

PlansComparision _$PlansComparisionFromJson(Map<String, dynamic> json) {
  return PlansComparision(
      plansValues: json['values'] == null
          ? null
          : PlansValues.fromJson(json['values'] as Map<String, dynamic>),
      plansGroupingMeta: (json['grouping_meta'] as List)
          ?.map((e) => e == null
              ? null
              : PlansGroupingMeta.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$PlansComparisionToJson(PlansComparision instance) =>
    <String, dynamic>{
      'values': instance.plansValues,
      'grouping_meta': instance.plansGroupingMeta
    };

PlansGroupingMeta _$PlansGroupingMetaFromJson(Map<String, dynamic> json) {
  return PlansGroupingMeta(value: json['value'] as String);
}

Map<String, dynamic> _$PlansGroupingMetaToJson(PlansGroupingMeta instance) =>
    <String, dynamic>{'value': instance.value};

PlansValues _$PlansValuesFromJson(Map<String, dynamic> json) {
  return PlansValues(
      plansEcommerce: (json['ecommerce'] as List)
          ?.map((e) => e == null
              ? null
              : PlansEcommerce.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      plansExtraFeatures: (json['extra_features'] as List)
          ?.map((e) => e == null
              ? null
              : PlansExtraFeatures.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      plansLogistics: (json['logistics'] as List)
          ?.map((e) => e == null
              ? null
              : PlansLogistics.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      plansPos: (json['pos'] as List)
          ?.map((e) =>
              e == null ? null : PlansPos.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      plansSupport: (json['support'] as List)
          ?.map((e) => e == null
              ? null
              : PlansSupport.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$PlansValuesToJson(PlansValues instance) =>
    <String, dynamic>{
      'ecommerce': instance.plansEcommerce,
      'logistics': instance.plansLogistics,
      'pos': instance.plansPos,
      'support': instance.plansSupport,
      'extra_features': instance.plansExtraFeatures
    };

PlansEcommerce _$PlansEcommerceFromJson(Map<String, dynamic> json) {
  return PlansEcommerce(
      eccomerceValueList: (json['value_list'] as List)
          ?.map((e) => e == null
              ? null
              : EccomerceValueList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      eventName: json['event_name'] as String);
}

Map<String, dynamic> _$PlansEcommerceToJson(PlansEcommerce instance) =>
    <String, dynamic>{
      'event_name': instance.eventName,
      'value_list': instance.eccomerceValueList
    };

EccomerceValueList _$EccomerceValueListFromJson(Map<String, dynamic> json) {
  return EccomerceValueList(
      isValid: json['is_valid'] as int, key: json['key'] as String);
}

Map<String, dynamic> _$EccomerceValueListToJson(EccomerceValueList instance) =>
    <String, dynamic>{'key': instance.key, 'is_valid': instance.isValid};

PlansLogistics _$PlansLogisticsFromJson(Map<String, dynamic> json) {
  return PlansLogistics(
      logisticsValueList: (json['value_list'] as List)
          ?.map((e) => e == null
              ? null
              : LogisticsValueList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      eventName: json['event_name'] as String);
}

Map<String, dynamic> _$PlansLogisticsToJson(PlansLogistics instance) =>
    <String, dynamic>{
      'event_name': instance.eventName,
      'value_list': instance.logisticsValueList
    };

LogisticsValueList _$LogisticsValueListFromJson(Map<String, dynamic> json) {
  return LogisticsValueList(
      isValid: json['is_valid'] as int, key: json['key'] as String);
}

Map<String, dynamic> _$LogisticsValueListToJson(LogisticsValueList instance) =>
    <String, dynamic>{'key': instance.key, 'is_valid': instance.isValid};

PlansPos _$PlansPosFromJson(Map<String, dynamic> json) {
  return PlansPos(
      posValueList: (json['value_list'] as List)
          ?.map((e) => e == null
              ? null
              : PosValueList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      eventName: json['event_name'] as String);
}

Map<String, dynamic> _$PlansPosToJson(PlansPos instance) => <String, dynamic>{
      'event_name': instance.eventName,
      'value_list': instance.posValueList
    };

PosValueList _$PosValueListFromJson(Map<String, dynamic> json) {
  return PosValueList(
      isValid: json['is_valid'] as int, key: json['key'] as String);
}

Map<String, dynamic> _$PosValueListToJson(PosValueList instance) =>
    <String, dynamic>{'key': instance.key, 'is_valid': instance.isValid};

PlansSupport _$PlansSupportFromJson(Map<String, dynamic> json) {
  return PlansSupport(
      supportValueList: (json['value_list'] as List)
          ?.map((e) => e == null
              ? null
              : SupportValueList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      eventName: json['event_name'] as String);
}

Map<String, dynamic> _$PlansSupportToJson(PlansSupport instance) =>
    <String, dynamic>{
      'event_name': instance.eventName,
      'value_list': instance.supportValueList
    };

SupportValueList _$SupportValueListFromJson(Map<String, dynamic> json) {
  return SupportValueList(
      isValid: json['is_valid'] as int, key: json['key'] as String);
}

Map<String, dynamic> _$SupportValueListToJson(SupportValueList instance) =>
    <String, dynamic>{'key': instance.key, 'is_valid': instance.isValid};

PlansExtraFeatures _$PlansExtraFeaturesFromJson(Map<String, dynamic> json) {
  return PlansExtraFeatures(
      extraFeaturesValueList: (json['value_list'] as List)
          ?.map((e) => e == null
              ? null
              : ExtraFeaturesValueList.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      eventName: json['event_name'] as String);
}

Map<String, dynamic> _$PlansExtraFeaturesToJson(PlansExtraFeatures instance) =>
    <String, dynamic>{
      'event_name': instance.eventName,
      'value_list': instance.extraFeaturesValueList
    };

ExtraFeaturesValueList _$ExtraFeaturesValueListFromJson(
    Map<String, dynamic> json) {
  return ExtraFeaturesValueList(
      isValid: json['is_valid'] as int, key: json['key'] as String);
}

Map<String, dynamic> _$ExtraFeaturesValueListToJson(
        ExtraFeaturesValueList instance) =>
    <String, dynamic>{'key': instance.key, 'is_valid': instance.isValid};

TrackingLogisticsRes _$TrackingLogisticsResFromJson(Map<String, dynamic> json) {
  return TrackingLogisticsRes(
      data: (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : TrackingLogisticsData.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      isLoading: json['isLoading'] as bool,
      status: json['status'] as bool)
    ..message = json['message'] as String
    ..is_loading = json['is_loading'] as bool;
}

Map<String, dynamic> _$TrackingLogisticsResToJson(
        TrackingLogisticsRes instance) =>
    <String, dynamic>{
      'message': instance.message,
      'is_loading': instance.is_loading,
      'status': instance.status,
      'isLoading': instance.isLoading,
      'data': instance.data
    };

TrackingLogisticsData _$TrackingLogisticsDataFromJson(
    Map<String, dynamic> json) {
  return TrackingLogisticsData(
      id: json['id'] as int,
      logo: json['logo'] as String,
      name: json['name'] as String);
}

Map<String, dynamic> _$TrackingLogisticsDataToJson(
        TrackingLogisticsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo': instance.logo,
      'name': instance.name
    };

OwnLogisticsRes _$OwnLogisticsResFromJson(Map<String, dynamic> json) {
  return OwnLogisticsRes(
      data: (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : OwnLogisticsData.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      isLoading: json['isLoading'] as bool,
      status: json['status'] as bool)
    ..message = json['message'] as String
    ..is_loading = json['is_loading'] as bool;
}

Map<String, dynamic> _$OwnLogisticsResToJson(OwnLogisticsRes instance) =>
    <String, dynamic>{
      'message': instance.message,
      'is_loading': instance.is_loading,
      'status': instance.status,
      'isLoading': instance.isLoading,
      'data': instance.data
    };

OwnLogisticsData _$OwnLogisticsDataFromJson(Map<String, dynamic> json) {
  return OwnLogisticsData(
      id: json['id'] as int,
      logo: json['logo'] as String,
      name: json['name'] as String);
}

Map<String, dynamic> _$OwnLogisticsDataToJson(OwnLogisticsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo': instance.logo,
      'name': instance.name
    };

OwnLogisticsSubmitRes _$OwnLogisticsSubmitResFromJson(
    Map<String, dynamic> json) {
  return OwnLogisticsSubmitRes(
      data: (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : OwnLogisticsSubmitData.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      isLoading: json['isLoading'] as bool,
      message: json['message'] as String,
      status: json['status'] as bool)
    ..is_loading = json['is_loading'] as bool;
}

Map<String, dynamic> _$OwnLogisticsSubmitResToJson(
        OwnLogisticsSubmitRes instance) =>
    <String, dynamic>{
      'is_loading': instance.is_loading,
      'status': instance.status,
      'isLoading': instance.isLoading,
      'message': instance.message,
      'data': instance.data
    };

OwnLogisticsSubmitData _$OwnLogisticsSubmitDataFromJson(
    Map<String, dynamic> json) {
  return OwnLogisticsSubmitData(
      eventId: json['event_id'] as String,
      requestId: json['request_id'] as String);
}

Map<String, dynamic> _$OwnLogisticsSubmitDataToJson(
        OwnLogisticsSubmitData instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'request_id': instance.requestId
    };

OrderCancellationRes _$OrderCancellationResFromJson(Map<String, dynamic> json) {
  return OrderCancellationRes(
      data: (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : OrderCancellationSubmitData.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      isLoading: json['isLoading'] as bool,
      message: json['message'] as String,
      status: json['status'] as bool)
    ..is_loading = json['is_loading'] as bool;
}

Map<String, dynamic> _$OrderCancellationResToJson(
        OrderCancellationRes instance) =>
    <String, dynamic>{
      'is_loading': instance.is_loading,
      'status': instance.status,
      'isLoading': instance.isLoading,
      'message': instance.message,
      'data': instance.data
    };

OrderCancellationSubmitData _$OrderCancellationSubmitDataFromJson(
    Map<String, dynamic> json) {
  return OrderCancellationSubmitData(
      eventId: json['event_id'] as String,
      requestId: json['request_id'] as String);
}

Map<String, dynamic> _$OrderCancellationSubmitDataToJson(
        OrderCancellationSubmitData instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'request_id': instance.requestId
    };

PaymentRes _$PaymentResFromJson(Map<String, dynamic> json) {
  return PaymentRes(
      data: (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : PaymentData.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      isLoading: json['isLoading'] as bool,
      status: json['status'] as bool,
      pagination: json['pagination'] == null
          ? null
          : PaymentPagination.fromJson(
              json['pagination'] as Map<String, dynamic>))
    ..message = json['message'] as String
    ..is_loading = json['is_loading'] as bool;
}

Map<String, dynamic> _$PaymentResToJson(PaymentRes instance) =>
    <String, dynamic>{
      'message': instance.message,
      'is_loading': instance.is_loading,
      'status': instance.status,
      'isLoading': instance.isLoading,
      'data': instance.data,
      'pagination': instance.pagination
    };

PaymentData _$PaymentDataFromJson(Map<String, dynamic> json) {
  return PaymentData(
      channelType: json['channel_type'] as String,
      orderId: json['order_id'] as String,
      productInfo: (json['product_info'] as List)
          ?.map((e) => e == null
              ? null
              : PaymentProductInfo.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      currencyCode: json['currency_code'] as String,
      marketplaceId: json['marketplace_id'] as String,
      productStatus: json['status'] as String,
      receiverDetails: json['receiver_details'] == null
          ? null
          : PaymentReceiverDetails.fromJson(
              json['receiver_details'] as Map<String, dynamic>),
      purchaseDate: json['purchase_date'] as String,
      orderAmount: (json['order_amount'] as num)?.toDouble());
}

Map<String, dynamic> _$PaymentDataToJson(PaymentData instance) =>
    <String, dynamic>{
      'channel_type': instance.channelType,
      'order_id': instance.orderId,
      'marketplace_id': instance.marketplaceId,
      'purchase_date': instance.purchaseDate,
      'status': instance.productStatus,
      'currency_code': instance.currencyCode,
      'product_info': instance.productInfo,
      'receiver_details': instance.receiverDetails,
      'order_amount': instance.orderAmount
    };

PaymentReceiverDetails _$PaymentReceiverDetailsFromJson(
    Map<String, dynamic> json) {
  return PaymentReceiverDetails(
      receiverPinCode: json['receiver_pin_code'] as String);
}

Map<String, dynamic> _$PaymentReceiverDetailsToJson(
        PaymentReceiverDetails instance) =>
    <String, dynamic>{'receiver_pin_code': instance.receiverPinCode};

PaymentProductInfo _$PaymentProductInfoFromJson(Map<String, dynamic> json) {
  return PaymentProductInfo(
      itemQuantity: json['item_quantity'] as int,
      productImageUrl: json['product_image_url'] as String,
      productTitle: json['product_title'] as String);
}

Map<String, dynamic> _$PaymentProductInfoToJson(PaymentProductInfo instance) =>
    <String, dynamic>{
      'product_image_url': instance.productImageUrl,
      'product_title': instance.productTitle,
      'item_quantity': instance.itemQuantity
    };

PaymentPagination _$PaymentPaginationFromJson(Map<String, dynamic> json) {
  return PaymentPagination(
      currentPage: json['current_page'] as String,
      nextpage: json['next_page'] as int,
      perPage: json['per_page'] as int,
      previousPage: json['previous_page'] as int,
      totalPages: json['total_pages'] as int);
}

Map<String, dynamic> _$PaymentPaginationToJson(PaymentPagination instance) =>
    <String, dynamic>{
      'total_pages': instance.totalPages,
      'per_page': instance.perPage,
      'current_page': instance.currentPage,
      'next_page': instance.nextpage,
      'previous_page': instance.previousPage
    };

SingleOrderRes _$SingleOrderResFromJson(Map<String, dynamic> json) {
  return SingleOrderRes(
      data: json['data'] == null
          ? null
          : SingleOrderData.fromJson(json['data'] as Map<String, dynamic>),
      isLoading: json['isLoading'] as bool,
      status: json['status'] as bool)
    ..message = json['message'] as String
    ..is_loading = json['is_loading'] as bool;
}

Map<String, dynamic> _$SingleOrderResToJson(SingleOrderRes instance) =>
    <String, dynamic>{
      'message': instance.message,
      'is_loading': instance.is_loading,
      'status': instance.status,
      'isLoading': instance.isLoading,
      'data': instance.data
    };

SingleOrderData _$SingleOrderDataFromJson(Map<String, dynamic> json) {
  return SingleOrderData(
      currencyCode: json['currency_code'] as String,
      orderStatus: json['status'] as String,
      productInfo: (json['product_info'] as List)
          ?.map((e) => e == null
              ? null
              : SingleorderProductInfo.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      purchaseDate: json['purchase_date'] as String,
      receiverDetails: json['receiver_details'] == null
          ? null
          : OrderReceiverDetails.fromJson(
              json['receiver_details'] as Map<String, dynamic>),
      orderAmount: (json['order_amount'] as num)?.toDouble());
}

Map<String, dynamic> _$SingleOrderDataToJson(SingleOrderData instance) =>
    <String, dynamic>{
      'receiver_details': instance.receiverDetails,
      'product_info': instance.productInfo,
      'purchase_date': instance.purchaseDate,
      'status': instance.orderStatus,
      'currency_code': instance.currencyCode,
      'order_amount': instance.orderAmount
    };

OrderReceiverDetails _$OrderReceiverDetailsFromJson(Map<String, dynamic> json) {
  return OrderReceiverDetails(
      receiverAddress1: json['receiver_address_1'] as String,
      receiverCity: json['receiver_city'] as String,
      receiverCountry: json['receiver_country'] as String,
      receiverCountryCode: json['receiver_country_code'] as String,
      receiverEmailId: json['receiver_email_id'] as String,
      receiverName: json['receiver_name'] as String,
      receiverpinCode: json['receiver_pin_code'] as String,
      receiverstate: json['receiver_state'] as String);
}

Map<String, dynamic> _$OrderReceiverDetailsToJson(
        OrderReceiverDetails instance) =>
    <String, dynamic>{
      'receiver_address_1': instance.receiverAddress1,
      'receiver_city': instance.receiverCity,
      'receiver_country': instance.receiverCountry,
      'receiver_country_code': instance.receiverCountryCode,
      'receiver_email_id': instance.receiverEmailId,
      'receiver_name': instance.receiverName,
      'receiver_pin_code': instance.receiverpinCode,
      'receiver_state': instance.receiverstate
    };

SingleorderProductInfo _$SingleorderProductInfoFromJson(
    Map<String, dynamic> json) {
  return SingleorderProductInfo(
      itemPrice: json['item_price'] == null
          ? null
          : SingleItemPrice.fromJson(
              json['item_price'] as Map<String, dynamic>),
      itemQuantity: json['item_quantity'] as int,
      itemTaxPercentage: json['item_tax_percentages'] == null
          ? null
          : SingleItemTaxPercentage.fromJson(
              json['item_tax_percentages'] as Map<String, dynamic>),
      productImageUrl: json['product_image_url'] as String,
      productTitle: json['product_title'] as String);
}

Map<String, dynamic> _$SingleorderProductInfoToJson(
        SingleorderProductInfo instance) =>
    <String, dynamic>{
      'product_title': instance.productTitle,
      'product_image_url': instance.productImageUrl,
      'item_quantity': instance.itemQuantity,
      'item_price': instance.itemPrice,
      'item_tax_percentages': instance.itemTaxPercentage
    };

SingleItemPrice _$SingleItemPriceFromJson(Map<String, dynamic> json) {
  return SingleItemPrice(
      amount: (json['amount'] as num)?.toDouble(),
      currencyCode: json['currency_code'] as String);
}

Map<String, dynamic> _$SingleItemPriceToJson(SingleItemPrice instance) =>
    <String, dynamic>{
      'currency_code': instance.currencyCode,
      'amount': instance.amount
    };

SingleItemTaxPercentage _$SingleItemTaxPercentageFromJson(
    Map<String, dynamic> json) {
  return SingleItemTaxPercentage(
      cgst: json['cgst'] as int, sgst: json['sgst'] as int);
}

Map<String, dynamic> _$SingleItemTaxPercentageToJson(
        SingleItemTaxPercentage instance) =>
    <String, dynamic>{'sgst': instance.sgst, 'cgst': instance.cgst};

PaymentDetailRes _$PaymentDetailResFromJson(Map<String, dynamic> json) {
  return PaymentDetailRes(
      data: (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : PaymentDetailData.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      isLoading: json['isLoading'] as bool,
      status: json['status'] as bool)
    ..message = json['message'] as String
    ..is_loading = json['is_loading'] as bool;
}

Map<String, dynamic> _$PaymentDetailResToJson(PaymentDetailRes instance) =>
    <String, dynamic>{
      'message': instance.message,
      'is_loading': instance.is_loading,
      'status': instance.status,
      'isLoading': instance.isLoading,
      'data': instance.data
    };

PaymentDetailData _$PaymentDetailDataFromJson(Map<String, dynamic> json) {
  return PaymentDetailData(
      itemPrice: json['item_price'] == null
          ? null
          : PaymentItemPrice.fromJson(
              json['item_price'] as Map<String, dynamic>),
      itemQuantity: json['item_quantity'] as int,
      itemTaxPercentage: json['item_tax_percentages'] == null
          ? null
          : PaymentTaxPercentage.fromJson(
              json['item_tax_percentages'] as Map<String, dynamic>),
      marketplaceId: json['marketplace_id'] as String,
      orderItemNumber: json['order_item_number'] as String,
      productImage: json['product_image_url'] as String,
      sellerSku: json['seller_sku'] as String);
}

Map<String, dynamic> _$PaymentDetailDataToJson(PaymentDetailData instance) =>
    <String, dynamic>{
      'marketplace_id': instance.marketplaceId,
      'product_image_url': instance.productImage,
      'item_quantity': instance.itemQuantity,
      'seller_sku': instance.sellerSku,
      'order_item_number': instance.orderItemNumber,
      'item_price': instance.itemPrice,
      'item_tax_percentages': instance.itemTaxPercentage
    };

PaymentItemPrice _$PaymentItemPriceFromJson(Map<String, dynamic> json) {
  return PaymentItemPrice(
      amount: (json['amount'] as num)?.toDouble(),
      currencyCode: json['currency_code'] as String);
}

Map<String, dynamic> _$PaymentItemPriceToJson(PaymentItemPrice instance) =>
    <String, dynamic>{
      'currency_code': instance.currencyCode,
      'amount': instance.amount
    };

PaymentTaxPercentage _$PaymentTaxPercentageFromJson(Map<String, dynamic> json) {
  return PaymentTaxPercentage(
      cgst: json['cgst'] as int, sgst: json['sgst'] as int);
}

Map<String, dynamic> _$PaymentTaxPercentageToJson(
        PaymentTaxPercentage instance) =>
    <String, dynamic>{'cgst': instance.cgst, 'sgst': instance.sgst};
