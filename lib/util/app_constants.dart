


import 'package:flutter/material.dart';

const ROUTE_HOME = "/home";
const ROUTE_LOGIN = "/login";
const ROUTE_PROFILE = "/profile";
const ROUTE_REGISTER = "/register";
const ROUTE_SUBSCRIPTION="/subscribe";


const ASSET_LOGO = "assets/images/logo.png";


const double GAP_SMALL = 4;
const double GAP_MEDIUM = 8;
const double GAP_LARGE = 12;
const double GAP_XLARGE = 16;
const double GAP_2XLARGE_GAP = 24;
const double GAP_3XLARGE_GAP = 32;


// API BASE URL
const BASE_URL = "https://idp-prod.vdezi.com";

final JSON_HEADERS = {
  "Content-type" : "application/json",
  "Accept": "application/json"
};


showSnackBarMessage(String message, GlobalKey<ScaffoldState> key ){
  final snackBar = SnackBar(content: Text(message ?? 'Something went wrong'));
  key.currentState.showSnackBar(snackBar);
}


const ACCOUNT_ID = "ACCOUNT_ID";
const USER_TOKEN = "USER_TOKEN";

//flutter packages pub run build_runner build