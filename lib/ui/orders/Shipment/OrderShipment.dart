import 'package:flutter/material.dart';

import 'package:eunimart/util/app_constants.dart';
import 'package:eunimart/ui/orders/Shipment/OwnLogistics/OwnLogistics.dart';

class OrderShipmwnt extends StatefulWidget {
  final String orderId;
  final String channelId;
  final int orderItemId;
  final int itemQty;
  final String skuId;
  final String marketplaceId;
  OrderShipmwnt(
      {Key key,
      @required this.channelId,
      @required this.orderId,
      @required this.itemQty,
      @required this.marketplaceId,
      @required this.orderItemId,
      @required this.skuId})
      : super(key: key);

  @override
  _OrderShipmwntState createState() => _OrderShipmwntState();
}

class _OrderShipmwntState extends State<OrderShipmwnt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text('Order Shipment'),
      ),
      body: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Card(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(15),
                    title: Text('Shedule Pickup', textAlign: TextAlign.center),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
              ),
              Container(
                child: Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          settings: RouteSettings(name: ROUTE_OWNLOGISTICS),
                          builder: (context) => OwnLogistics(
                              channelId: widget.channelId,
                              orderId: widget.orderId,
                              orderItemId: widget.orderItemId,
                              itemQty: widget.itemQty,
                              skuId: widget.skuId,
                              marketplaceId: widget.marketplaceId),
                        ),
                      );
                    },
                    contentPadding: EdgeInsets.all(15),
                    title: Text(
                      'Own Logistics',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
