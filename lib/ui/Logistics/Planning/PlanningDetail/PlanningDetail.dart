import 'package:flutter/material.dart';
import 'package:eunimart/app_models.dart';

class PlanningDetail extends StatefulWidget {
  // final String from;
  // final String to;
  // final String volumetricWeight;
  // final String weightConsidered;
  // final String carrier;
  // final String shipmentType;
  // final String shipmentPartnerId;
  // final String currency;
  // final String timeline;
  // final String price;
  // final String length;
  // final String width;
  // final String weight;
  // final String height;
  final String from;
  final String to;
  final double length;
  final double width;
  final double height;
  final double weight;
  final double volumetricWeight;
  final double weightConsidered;
  final double price;
  final String shippingPartnerId;
  final String carrier;
  final String shipmentType;

  final String timeline;
  final String currency;

  PlanningDetail({
    Key key,
    @required this.from,
    @required this.to,
    @required this.length,
    @required this.width,
    @required this.height,
    @required this.volumetricWeight,
    @required this.weightConsidered,
    @required this.weight,
    @required this.price,
    @required this.shippingPartnerId,
    @required this.carrier,
    @required this.shipmentType,
    @required this.timeline,
    @required this.currency,
  }) : super(key: key);

  @override
  _PlanningDetailState createState() => _PlanningDetailState();
}

class _PlanningDetailState extends State<PlanningDetail> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
