import 'package:flutter/material.dart';
import 'package:eunimart/app_models.dart';
import 'package:eunimart/ui/home/home.dart';

// import 'package:eunimart/ui/error/error.dart';
import 'package:eunimart/ui/orders/Orders.dart';

// import 'package:intl/intl.dart';
import 'package:eunimart/util/app_constants.dart';
import 'package:eunimart/ui/orders/orderCancellation/OrderCancellation_vm.dart';

class OrderCancellation extends StatefulWidget {
  final String orderId;
  final String channelId;
  final int orderItemId;
  final int itemQty;
  final String skuId;
  final String marketplaceId;
  OrderCancellation(
      {Key key,
      @required this.channelId,
      @required this.orderId,
      @required this.itemQty,
      @required this.marketplaceId,
      @required this.orderItemId,
      @required this.skuId})
      : super(key: key);

  @override
  _OrderCancellationState createState() => _OrderCancellationState();
}

class _OrderCancellationState extends State<OrderCancellation> {
  OrderCancellationVM orderCancellationVM = OrderCancellationVM();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Order Cancellation'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Text(
              'select Reason for cancellation : ',
              style: TextStyle(color: Colors.black),
            ),
            Padding(
              padding: EdgeInsets.all(2),
            ),
            DropdownButton<String>(
              itemHeight: 70,

              style: TextStyle(
                color: Colors.black,
              ),
              dropdownColor: Colors.white,
              // iconEnabledColor: Colors.black,

              items: [
                DropdownMenuItem<String>(
                  child: Text('Didnt like the product'),
                  value: 1.toString(),
                ),
                DropdownMenuItem<String>(
                  child: Text('Didnt like the product'),
                  value: 2.toString(),
                ),
                DropdownMenuItem<String>(
                  child: Text('Didnt like the product'),
                  value: 3.toString(),
                ),
                DropdownMenuItem<String>(
                  child: Text('Didnt like the product'),
                  value: 4.toString(),
                ),
                DropdownMenuItem<String>(
                  child: Text('Didnt like the product'),
                  value: 5.toString(),
                ),
                DropdownMenuItem<String>(
                  child: Text('Didnt like the product'),
                  value: 6.toString(),
                ),
                DropdownMenuItem<String>(
                  child: Text('Didnt like the product'),
                  value: 7.toString(),
                ),
                DropdownMenuItem<String>(
                  child: Text('Didnt like the product'),
                  value: 8.toString(),
                ),
              ],
              onChanged: (String value) {
                setState(() {
                  _value = value;
                });
              },
              hint: Text(
                'Select Item',
                style: TextStyle(color: Colors.black),
              ),
              value: _value,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
            ),
            Text('Message', style: TextStyle(color: Colors.black)),
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                  style: TextStyle(color: Colors.black),
                  // controller: awbNo,
                  enableInteractiveSelection: false,
                  keyboardType: TextInputType.text,
                  maxLines: 3,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Message',
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    counterText: "",
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            RaisedButton(
              onPressed: () {
                _onSubmitClicked();
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }

  void _onSubmitClicked() async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'Alert',
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Are you sure you want to cancel the order'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: RaisedButton(
                            color: Colors.red,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    settings: RouteSettings(name: ROUTE_ORDERS),
                                    builder: (context) => Home()),
                              );
                            },
                            child: Text('No'),
                          ),
                        ),
                        Container(
                          child: RaisedButton(
                            color: Colors.green,
                            onPressed: () async {
                              OrderCancellationRes res =
                                  await orderCancellationVM
                                      .submitCancellationData(
                                          _value,
                                          widget.channelId,
                                          widget.orderId,
                                          widget.orderItemId.toString(),
                                          widget.itemQty,
                                          widget.skuId.toString(),
                                          widget.marketplaceId);
                              if (res.status) {
                                showSnackBarMessage(
                                    "${res.message}", _scaffoldKey);
                              }
                            },
                            child: Text('Yes'),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ));
  }
}
