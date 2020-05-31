import 'package:flutter/material.dart';
import 'package:eunimart/ui/orders/ordersDetail/OrderDetail_vm.dart';
import 'package:eunimart/app_models.dart';
import 'package:eunimart/ui/error/error.dart';
import 'package:intl/intl.dart';

class OrderDetail extends StatefulWidget {
  final String orderId;
  final String channelId;
  final String productTitle;
  OrderDetail(
      {Key key,
      @required this.channelId,
      @required this.orderId,
      @required this.productTitle})
      : super(key: key);

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  OrderDetailVM orderDetailVm = OrderDetailVM();
  Future<SingleOrderRes> mF;
  @override
  void initState() {
    super.initState();
    mF = orderDetailVm.getSingleOrderData(widget.orderId, widget.channelId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('${widget.productTitle}'),
        ),
        key: _scaffoldKey,
        body: FutureBuilder(
            initialData: null,
            future: mF,
            builder: (context, snap) => _checkAPIData(context, snap)));
  }

  Widget _checkAPIData(BuildContext c, AsyncSnapshot snap) {
    //ConnectionState.active = snap.connectionState
    if (snap.hasData) {
      // API
      // 404
      // catch
      SingleOrderRes _d = snap.data;
      //  var status = _d.status;

      if (_d.status) {
        // API true
        return _buildList(c, _d);
      } else if (_d.is_loading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Scaffold(
          backgroundColor: Colors.white,
          //backgroundColor: Theme.of(context).primaryColor,
//          appBar: AppBarr(),
          body: Err(
              bar_visibility: false,
              p_title: 'Order',
              m: _d.message,
              mL: () => setState(() {
                    _d.is_loading = true;
                    mF = orderDetailVm.getSingleOrderData(
                        widget.orderId, widget.channelId);
                  })),
        );
      }
    } else {
      // initial loading
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget _buildList(BuildContext c, SingleOrderRes res) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    var formatter = DateFormat('yMMMEd');
    Future.delayed(Duration.zero, () => _showMyDialog());

    print('${res.data.productInfo[0].productTitle}');
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 8, top: 8),
                child: res.data.productInfo[0].productImageUrl == null
                    ? CircleAvatar(
                        radius: 37,
                        backgroundColor: Colors.grey,
                        child: Text(
                          'No Image',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                    : Image.network(
                        '${res.data.productInfo[0].productImageUrl}',
                        // height: h / 3,

                        fit: BoxFit.contain,
                        width: w / 5,
                      ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
              ),
              Flexible(
                child: Text('${res.data.productInfo[0].productTitle}'),
              )
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Text(
            'Product Information',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 12,
                      child: Row(
                        children: [
                          Text('Order Id'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(':'),
                    ),
                    Expanded(
                      flex: 11,
                      child: Text('${widget.orderId}'),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Row(
                  children: [
                    Expanded(
                      flex: 12,
                      child: Row(
                        children: [
                          Text('Purchase Date'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(':'),
                    ),
                    Expanded(
                      flex: 11,
                      child: Text(
                          '${formatter.format(DateTime.parse(res.data.purchaseDate))}'),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Row(
                  children: [
                    Expanded(
                      flex: 12,
                      child: Row(
                        children: [
                          Text('Status'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(':'),
                    ),
                    Expanded(
                        flex: 11,
                        child: Row(
                          children: [
                            Text('${res.data.orderStatus}'),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                            ),
                            Icon(Icons.local_shipping)
                          ],
                        ))
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
          ),
          Text(
            'Product Amount',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 12,
                      child: Row(
                        children: [
                          Text('Price'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(':'),
                    ),
                    Expanded(
                        flex: 11,
                        child: Row(
                          children: [
                            Text(
                                '${res.data.productInfo[0].itemPrice.currencyCode}'),
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                            ),
                            Text('${res.data.productInfo[0].itemPrice.amount}')
                          ],
                        ))
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Row(
                  children: [
                    Expanded(
                      flex: 12,
                      child: Row(
                        children: [
                          Text('Tax'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(':'),
                    ),
                    Expanded(
                      flex: 11,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text('Cgst'),
                              Text(
                                  '${res.data.productInfo[0].itemTaxPercentage.cgst}'),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text('Sgst'),
                                  Text(
                                      '${res.data.productInfo[0].itemTaxPercentage.sgst}')
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Row(
                  children: [
                    Expanded(
                      flex: 12,
                      child: Row(
                        children: [
                          Text('Total'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(':'),
                    ),
                    Expanded(
                        flex: 11,
                        child: Row(
                          children: [
                            Text(
                                '${res.data.productInfo[0].itemPrice.currencyCode}'),
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                            ),
                            Text('${res.data.orderAmount}')
                          ],
                        ))
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
          ),
          Text(
            'Receiver Details',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 12,
                      child: Row(
                        children: [
                          Text('Name'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(':'),
                    ),
                    Expanded(
                      flex: 11,
                      child: Text('${res.data.receiverDetails.receiverName}'),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Row(
                  children: [
                    Expanded(
                      flex: 12,
                      child: Row(
                        children: [
                          Text('email'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(':'),
                    ),
                    Expanded(
                      flex: 11,
                      child:
                          Text('${res.data.receiverDetails.receiverEmailId}'),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Row(
                  children: [
                    Expanded(
                      flex: 12,
                      child: Row(
                        children: [
                          Text('Address'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(':'),
                    ),
                    Expanded(
                      flex: 11,
                      child:
                          Text('${res.data.receiverDetails.receiverAddress1}'),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Row(
                  children: [
                    Expanded(
                      flex: 12,
                      child: Row(
                        children: [
                          Text('City'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(':'),
                    ),
                    Expanded(
                      flex: 11,
                      child: Text('${res.data.receiverDetails.receiverCity}'),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Row(
                  children: [
                    Expanded(
                      flex: 12,
                      child: Row(
                        children: [
                          Text('State'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(':'),
                    ),
                    Expanded(
                      flex: 11,
                      child: Text('${res.data.receiverDetails.receiverstate}'),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Row(
                  children: [
                    Expanded(
                      flex: 12,
                      child: Row(
                        children: [
                          Text('Country'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(':'),
                    ),
                    Expanded(
                      flex: 11,
                      child:
                          Text('${res.data.receiverDetails.receiverCountry}'),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Row(
                  children: [
                    Expanded(
                      flex: 12,
                      child: Row(
                        children: [
                          Text('Country Code'),
                          Text(':'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(':'),
                    ),
                    Expanded(
                      flex: 11,
                      child: Text(
                          '${res.data.receiverDetails.receiverCountryCode}'),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Row(
                  children: [
                    Expanded(
                      flex: 12,
                      child: Row(
                        children: [
                          Text('pincode'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(':'),
                    ),
                    Expanded(
                      flex: 11,
                      child:
                          Text('${res.data.receiverDetails.receiverpinCode}'),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
          Container(
            child: Column(
              children: [],
            ),
          )
        ],
      ),
    );
  }

//   This snippet shows a method in a State which, when called, displays a dialog box and returns a Future that completes when the dialog is dismissed.
// assignment
  void _showMyDialog() async {
    print('inside');

    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Alert'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                        'The detailed Invoice  would be available in the web application from where it  can be downloaded.'),
                  ],
                ),
              ),
            ));
  }
}
