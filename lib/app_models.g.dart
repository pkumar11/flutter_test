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
              : PlanningData.fromJson(e as Map<String, dynamic>))
          ?.toList())
    ..message = json['message'] as String
    ..is_loading = json['is_loading'] as bool;
}

Map<String, dynamic> _$PlanningResToJson(PlanningRes instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'is_loading': instance.is_loading,
      'data': instance.data
    };

PlanningData _$PlanningDataFromJson(Map<String, dynamic> json) {
  return PlanningData(
      from: json['from'] as String,
      to: json['to'] as String,
      length: (json['length'] as num)?.toDouble(),
      width: (json['width'] as num)?.toDouble(),
      height: (json['height'] as num)?.toDouble(),
      weight: (json['weight'] as num)?.toDouble(),
      volumetric_weight: (json['volumetric_weight'] as num)?.toDouble(),
      weight_considered: (json['weight_considered'] as num)?.toDouble(),
      price: (json['price'] as num)?.toDouble(),
      shipping_partner_id: json['shipping_partner_id'] as String,
      carrier: json['carrier'] as String,
      shipment_type: json['shipment_type'] as String,
      carrier_logo: json['carrier_logo'] as String,
      timeline: json['timeline'] as String,
      currency: json['currency'] as String);
}

Map<String, dynamic> _$PlanningDataToJson(PlanningData instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
      'weight': instance.weight,
      'volumetric_weight': instance.volumetric_weight,
      'weight_considered': instance.weight_considered,
      'price': instance.price,
      'shipping_partner_id': instance.shipping_partner_id,
      'carrier': instance.carrier,
      'shipment_type': instance.shipment_type,
      'carrier_logo': instance.carrier_logo,
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
          ?.toList())
    ..message = json['message'] as String;
}

Map<String, dynamic> _$OrderResToJson(OrderRes instance) => <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'is_loading': instance.is_loading,
      'data': instance.data
    };

OrderData _$OrderDataFromJson(Map<String, dynamic> json) {
  return OrderData(
      channelId: json['channelId'] as String,
      orderId: json['channel_id'] as String,
      channelType: json['order_id'] as String,
      currencyCode: json['channel_type'] as String,
      orderAmount: (json['currnecy_code'] as num)?.toDouble(),
      purchaseDate: json['order_amount'] as String,
      productInfo: (json['purchase_date'] as List)
          ?.map((e) => e == null
              ? null
              : OrderProductInfo.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$OrderDataToJson(OrderData instance) => <String, dynamic>{
      'channelId': instance.channelId,
      'channel_id': instance.orderId,
      'order_id': instance.channelType,
      'channel_type': instance.currencyCode,
      'currnecy_code': instance.orderAmount,
      'order_amount': instance.purchaseDate,
      'purchase_date': instance.productInfo
    };

OrderProductInfo _$OrderProductInfoFromJson(Map<String, dynamic> json) {
  return OrderProductInfo(
      productTitle: json['productTitle'] as String,
      itemQuantity: json['product_title'] as int);
}

Map<String, dynamic> _$OrderProductInfoToJson(OrderProductInfo instance) =>
    <String, dynamic>{
      'productTitle': instance.productTitle,
      'product_title': instance.itemQuantity
    };

KycRes _$KycResFromJson(Map<String, dynamic> json) {
  return KycRes(
      status: json['status'] as bool,
      isLoading: json['isLoading'] as bool,
      data: json['data'] == null
          ? null
          : KycData.fromJson(json['data'] as Map<String, dynamic>))
    ..message = json['message'] as String
    ..is_loading = json['is_loading'] as bool;
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
