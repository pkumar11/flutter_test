import 'package:flutter/material.dart';

const ROUTE_HOME = "/home";
const ROUTE_LOGIN = "/login";
const ROUTE_SIGNUP = "/signup";
const ROUTE_PROFILE = "/profile";
const ROUTE_REGISTER = "/register";
const ROUTE_SUBSCRIPTION = "/subscribe";
const ROUTE_PLANNING = "/planning";
const ROUTE_CREATESHIPMENT = "/createshipment";
const ROUTE_SHIPPERDETAILS = "/shipperdetails";
const ROUTE_PICKUPDETAIL = "/pickupdetail";
const ROUTE_PACKAGEDETAILS = "/packagedetails";
const ROUTE_RECEIVERDETAILS = "/receiverdetails";
const ROUTE_ALLPLANS = "/allplans";
const ROUTE_ORDERDETAIL = "/orderdetail";
const ROUTE_PAYMENTDETAIL = "/paymentdetail";
const ROUTE_ORDERSHIPMENT = "/ordershipment";
const ROUTE_OWNLOGISTICS = "/ownlogistics";
const ROUTE_ORDERCANCELLATION = "/ordercancellation";
const ROUTE_SCHEDULEPICKUP = "/schedulepickup";
const ROUTE_ORDERS = "/orders";
const ROUTE_FILTER = "/filter";
const ROUTE_PLANNINGLIST = "/planninglist";
const ROUTE_PLANNINGDETAIL = "/planningdetail";

const ASSET_LOGO = "assets/images/logo.png";

const double GAP_SMALL = 4;
const double GAP_MEDIUM = 8;
const double GAP_LARGE = 12;
const double GAP_XLARGE = 16;
const double GAP_2XLARGE_GAP = 24;
const double GAP_3XLARGE_GAP = 32;

// API BASE URL
const BASE_URL = "https://idp-prod.vdezi.com";
const SHIPPING_MANAGEMENT = "https://idp-testing.vdezi.com";
const ORDER_MANAGEMENT = "https://idp-testing.vdezi.com";

final JSON_HEADERS = {
  "Content-type": "application/json",
  "Accept": "application/json"
};

showSnackBarMessage(String message, GlobalKey<ScaffoldState> key) {
  print('message == $message');
  final snackBar =
      SnackBar(content: Text('$message' ?? 'Something went wrong'));
  print('snakbar  $snackBar');
  key.currentState.showSnackBar(snackBar);
}

const ACCOUNT_ID = "ACCOUNT_ID";
const USER_TOKEN = "USER_TOKEN";
const USER_ID = "USER_ID";

//flutter packages pub run build_runner build
