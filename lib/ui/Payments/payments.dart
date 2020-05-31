import 'package:flutter/material.dart';
import 'package:eunimart/ui/Payments/Payments_vm.dart';
import 'package:eunimart/app_models.dart';
import 'package:eunimart/ui/error/error.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart';
import 'package:eunimart/ui/Payments/paymentsDetail/PaymentsDetail.dart';
import 'package:eunimart/util/app_constants.dart';

class Payments extends StatefulWidget {
  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  PaymentsVM paymentVm = PaymentsVM();
  Future<PaymentRes> mF;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    mF = _getDataAfterSomeTime();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('lassst');

        _getMoreData();
      }
    });
  }

  Future<PaymentRes> _getMoreData() async {
    print('last');
    // setState(() {});

    return paymentVm.getMorePaymentData(2);
  }

  Future<PaymentRes> _getDataAfterSomeTime() async {
    await Future.delayed(Duration(seconds: 5));
    return paymentVm.getPaymentData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
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
      PaymentRes _d = snap.data;
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
                    mF = paymentVm.getPaymentData();
                  })),
        );
      }
    } else {
      // initial loading
      // return Center(
      //   child: CircularProgressIndicator(),
      // );

      final w = MediaQuery.of(context).size.width;
      final h = MediaQuery.of(context).size.height;
      return ListView.builder(
        itemCount: 10,
        // Important code
        itemBuilder: (context, index) => Shimmer.fromColors(
            baseColor: Colors.grey[400],
            highlightColor: Colors.white,
            child: Container(
                decoration: BoxDecoration(
                    // color: Colors.,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all()),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                width: w,
                height: h / 3 - 10,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.white,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: w / 1.5,
                                height: 10,
                                color: Colors.black),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2),
                            ),
                            Container(
                              width: w / 2,
                              height: 10,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 4),
                            ),
                            Container(
                              width: w / 3,
                              height: 10,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 4),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: w / 4,
                              height: 10,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2),
                            ),
                            Container(
                                width: w / 5, height: 10, color: Colors.white),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: w / 4,
                              height: 10,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2),
                            ),
                            Container(
                                width: w / 5, height: 10, color: Colors.white),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: w / 4,
                              height: 10,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2),
                            ),
                            Container(
                                width: w / 5, height: 10, color: Colors.white),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            width: w / 4, height: 30, color: Colors.white),
                      ],
                    )
                  ],
                ))),
      );
    }
  }

  Widget _buildList(BuildContext c, PaymentRes res) {
    var formatter = DateFormat('yMMMd');
    final w = MediaQuery.of(context).size.width;
    print(res.data.length);
    return res.data.length == 0
        ? Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    'assets/images/search.png',
                    width: w / 2,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  'No Data Found',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.all(8),
            child: ListView.builder(
                controller: _scrollController,
                itemCount: res.data.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(
                      //   width: 1.0,
                      //   color: Colors.black,
                      // ),
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        print('${res.data[index].orderId}');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentDetail(
                              orderId: res.data[index].orderId,
                              orderAmount: res.data[index].orderAmount,
                              purchaseDate: res.data[index].purchaseDate,
                              productTitle:
                                  res.data[index].productInfo[0].productTitle,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: CircleAvatar(
                                  radius: w / 10,
                                  backgroundImage: res.data[index]
                                              .productInfo[0].productImageUrl ==
                                          null
                                      ? null
                                      : NetworkImage(
                                          '${res.data[index].productInfo[0].productImageUrl}'),
                                  child: res.data[index].productInfo[0]
                                              .productImageUrl ==
                                          null
                                      ? Text(
                                          'No Image',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      : null,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8),
                              ),
                              Flexible(
                                child: Column(
                                  children: [
                                    Text(
                                        '${res.data[index].productInfo[0].productTitle}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Padding(
                                      padding: EdgeInsets.all(3),
                                    ),
                                    Row(
                                      children: [
                                        Text('Order Id :'),
                                        Padding(
                                          padding: EdgeInsets.only(right: 5),
                                        ),
                                        Text('${res.data[index].orderId}')
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(3),
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text('Date'),
                                  Text(
                                      '${formatter.format(DateTime.parse(res.data[index].purchaseDate))}')
                                ],
                              ),
                              Column(
                                children: [
                                  Text('Receiver PinCode'),
                                  Text(
                                      '${res.data[index].receiverDetails.receiverPinCode}')
                                ],
                              ),
                              Column(
                                children: [
                                  // Padding(
                                  //   padding: EdgeInsets.only(top: 3),
                                  // ),
                                  Text('Status'),
                                  Row(
                                    children: [
                                      Text('${res.data[index].productStatus}'),
                                      Padding(
                                        padding: EdgeInsets.only(right: 3),
                                      ),
                                      Icon(
                                        Icons.local_shipping,
                                        size: 17,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: RaisedButton(
                              color: Colors.blue,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    settings: RouteSettings(
                                        name: ROUTE_PAYMENTDETAIL),
                                    builder: (context) => PaymentDetail(
                                      orderId: res.data[index].orderId,
                                      orderAmount: res.data[index].orderAmount,
                                      purchaseDate:
                                          res.data[index].purchaseDate,
                                      productTitle: res.data[index]
                                          .productInfo[0].productTitle,
                                    ),
                                  ),
                                );
                              },
                              child: Text('More Info',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }));
  }
}
