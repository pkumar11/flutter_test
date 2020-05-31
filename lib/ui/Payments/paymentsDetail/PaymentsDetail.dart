import 'package:flutter/material.dart';
import 'package:eunimart/ui/Payments/paymentsDetail/PaymentsDetail_vm.dart';
import 'package:eunimart/app_models.dart';
import 'package:eunimart/ui/error/error.dart';
import 'package:intl/intl.dart';

class PaymentDetail extends StatefulWidget {
  final String orderId;
  final double orderAmount;
  final String productTitle;
  final String purchaseDate;
  PaymentDetail(
      {Key key,
      @required this.orderAmount,
      @required this.orderId,
      @required this.purchaseDate,
      @required this.productTitle})
      : super(key: key);

  @override
  _PaymentDetailState createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentDetail> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  PaymentsDetailVM paymentDetailVm = PaymentsDetailVM();
  Future<PaymentDetailRes> mF;
  @override
  void initState() {
    super.initState();
    mF = paymentDetailVm.getPaymentData(widget.orderId);
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
      PaymentDetailRes _d = snap.data;
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
                    mF = paymentDetailVm.getPaymentData(widget.orderId);
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

  Widget _buildList(BuildContext c, PaymentDetailRes res) {
    final w = MediaQuery.of(context).size.width;
    var formatter = DateFormat('yMMMEd');

    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 8, top: 8),
                child: res.data[0].productImage == null
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
                        '${res.data[0].productImage}',
                        // height: h / 3,

                        fit: BoxFit.contain,
                        width: w / 5,
                      ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
              ),
              Flexible(
                child: Text('${widget.productTitle}'),
              )
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Container(
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
                          '${formatter.format(DateTime.parse(widget.purchaseDate))}'),
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
                          Text('Seller sku'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(':'),
                    ),
                    Expanded(
                      flex: 11,
                      child: Text('${res.data[0].sellerSku}'),
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
                          Text('MarketPlace Id'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(':'),
                    ),
                    Expanded(
                      flex: 11,
                      child: Text('${res.data[0].marketplaceId}'),
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
                          Text('Item Quantity'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(':'),
                    ),
                    Expanded(
                      flex: 11,
                      child: Text('${res.data[0].itemQuantity}'),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
                Row(
                  children: [
                    Text(
                      'Product Amount',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                ),
                Container(
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
                                      '${res.data[0].itemPrice.currencyCode == null ? ' ' : res.data[0].itemPrice.currencyCode}'),
                                  Padding(
                                    padding: EdgeInsets.only(right: 5),
                                  ),
                                  Text('${res.data[0].itemPrice.amount}')
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
                                        '${res.data[0].itemTaxPercentage.cgst}'),
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
                                            '${res.data[0].itemTaxPercentage.sgst}')
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
                                      '${res.data[0].itemPrice.currencyCode == null ? ' ' : res.data[0].itemPrice.currencyCode}'),
                                  Padding(
                                    padding: EdgeInsets.only(right: 5),
                                  ),
                                  Text('${widget.orderAmount}')
                                ],
                              ))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
