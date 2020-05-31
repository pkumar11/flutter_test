import 'package:flutter/material.dart';
import 'package:eunimart/ui/orders/Orders_vm.dart';
import 'package:eunimart/app_models.dart';
import 'package:eunimart/ui/error/error.dart';
import 'package:intl/intl.dart';
import 'package:eunimart/ui/orders/ordersDetail/OrderDetail.dart';
import 'package:eunimart/util/app_constants.dart';
import 'package:eunimart/ui/orders/Shipment/OrderShipment.dart';
import 'package:eunimart/ui/orders/orderCancellation/OrderCancellation.dart';
import 'package:eunimart/singleton/AAASingleton.dart';
import 'package:eunimart/ui/orders/filterPage/FilterPage.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';

class Orders extends StatefulWidget {
  final int filterValue;
  final String url;

  Orders({Key key, this.filterValue, this.url}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  OrderVM orderVm = OrderVM();

  ScrollController _scrollController = ScrollController();
  Timer timer;

  Future<OrderRes> mF;
  AAASingleton appSingleton = AAASingleton();
  Icon cusIcon = Icon(Icons.search);
  Widget cusText = Text(
    'shown all orders',
  );
  Widget filterData = Text('Filter Data');
  TextEditingController searchValue = TextEditingController();
  bool showList = true;
  String searchText;
  int pageNo = 1;
  bool initial = true;

  @override
  void initState() {
    mF = widget.filterValue == 1
        ? _getMarketPlaceFilterdata()
        : _getSomeData(pageNo);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        mF = _getMoreData();
      }
    });
    super.initState();
  }

  Future<OrderRes> _getMarketPlaceFilterdata() async {
    await Future.delayed(Duration(seconds: 5));
    print('inside getmarketplace');
    return orderVm.getMarketplaceData(widget.url);
  }

  Future<OrderRes> _getSomeData(pageNo) async {
    await Future.delayed(Duration(seconds: 5));

    return orderVm.getOrderData(pageNo);
  }

  Future<OrderRes> _getMoreData() async {
    print('inside getmore data');
    pageNo = pageNo + 1;
    setState(() {
      initial = false;
    });
    return orderVm.getOrderData(pageNo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: widget.filterValue == 1 ? filterData : cusText,
          actions: [
            widget.filterValue != 1
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        if (this.cusIcon.icon == Icons.search) {
                          this.cusIcon = Icon(Icons.cancel);
                          this.showList = false;
                          this.cusText = TextField(
                            onSubmitted: (text) {
                              _changeOrdersList(context, text);
                            },
                            controller: this.searchValue,
                            showCursor: true,
                            autofocus: true,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search by order Id'),
                            textInputAction: TextInputAction.go,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          );
                        } else {
                          this.cusIcon = Icon(Icons.search);
                          this.cusText = Text('Shown all orders');
                          this.showList = true;
                          this.mF = orderVm.getOrderData(pageNo);
                        }
                      });
                    },
                    icon: cusIcon,
                  )
                : Text(''),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    settings: RouteSettings(name: ROUTE_FILTER),
                    builder: (context) => FilterPage(),
                  ),
                );
              },
              icon: Icon(Icons.filter_list),
            )
          ],
        ),
        key: _scaffoldKey,
        body: FutureBuilder(
            initialData: null,
            future: mF,
            builder: (context, snap) => this.initial
                ? _checkAPIData(context, snap)
                : _buildSearch(context, snap)));
  }

  Future<OrderRes> _changeOrdersList(context, String text) async {
    print(text);
    setState(() {
      this.searchText = text;
    });
    // this.searchValue = TextEditingController(text: '');
    this.mF = orderVm.getSearchData(text);
    // print('${res.data[0].channelId}===>');
    // _buildList(context, res);
  }

  Widget _buildSearch(BuildContext c, AsyncSnapshot snap) {
    if (snap.hasData) {
      // API
      // 404
      // catch
      OrderRes _d = snap.data;
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

                    mF = this.showList
                        ? orderVm.getOrderData(1)
                        : orderVm.getSearchData(this.searchText);
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

  Widget _checkAPIData(BuildContext c, AsyncSnapshot snap) {
    //ConnectionState.active = snap.connectionState
    if (snap.hasData) {
      // API
      // 404
      // catch
      OrderRes _d = snap.data;
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

                    mF = this.showList
                        ? orderVm.getOrderData(1)
                        : orderVm.getSearchData(this.searchText);
                  })),
        );
      }
    } else {
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
                height: h / 4 + 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                    ),
                    Container(width: w, height: 10, color: Colors.black),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                    ),
                    Container(
                      width: w / 2,
                      height: 10,
                      color: Colors.white,
                      alignment: Alignment.centerLeft,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                    ),
                    Container(
                      width: w / 3,
                      height: 10,
                      color: Colors.white,
                      alignment: Alignment.centerLeft,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
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
                              width: w / 5,
                              height: 10,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2),
                            ),
                            Container(
                                width: w / 6, height: 10, color: Colors.white),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: w / 5,
                              height: 10,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2),
                            ),
                            Container(
                                width: w / 6, height: 10, color: Colors.white),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: w / 5,
                              height: 10,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2),
                            ),
                            Container(
                                width: w / 6, height: 10, color: Colors.white),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: w / 5,
                              height: 10,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2),
                            ),
                            Container(
                                width: w / 6, height: 10, color: Colors.white),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: w / 4, height: 30, color: Colors.white),
                        Container(
                            width: w / 4, height: 30, color: Colors.white),
                        Container(
                            width: w / 4, height: 30, color: Colors.white),
                      ],
                    )
                  ],
                ))),
      );
      // return Center(
      //   child: CircularProgressIndicator(),
      // );
    }
  }

  Widget _buildsomething(BuildContext c, OrderRes res) {
    print('oooo');
    return Text('llll');
  }

  Widget _buildList(BuildContext c, OrderRes res) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    // print(this.showList);
    // DateTime now = new DateTime.now();
    // DateTime date = new DateTime(now.year, now.month, now.day);
    // var now = new DateTime.now();
    var formatter = DateFormat('yMMMd');

    print('${res.data.length}');
    print('${this.initial}');
    // print('$date');
    var toggleButton = res.data.length;
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
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: ListView.builder(
                controller: _scrollController,
                itemCount: res.data.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                        ),
                        Text(
                          '${res.data[index].productInfo[0].productTitle}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
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
                                Text('Marketplace'),
                                Text(
                                    '${res.data[index].productInfo[0].marketplaceId}'),
                              ],
                            ),
                            Column(
                              children: [
                                Text('Channel'),
                                Text('${res.data[index].channelType}')
                              ],
                            ),
                            Column(
                              children: [
                                Text('Price'),
                                Row(
                                  children: [
                                    Text(
                                        '${res.data[index].currencyCode == null ? '' : res.data[index].currencyCode}'),
                                    Padding(
                                      padding: EdgeInsets.only(right: 3),
                                    ),
                                    Text('${res.data[index].orderAmount}')
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    settings:
                                        RouteSettings(name: ROUTE_ORDERDETAIL),
                                    builder: (context) => OrderDetail(
                                      orderId: res.data[index].orderId,
                                      channelId: res.data[index].channelId,
                                      productTitle: res.data[index]
                                          .productInfo[0].productTitle,
                                    ),
                                  ),
                                );
                              },
                              color: Colors.blue,
                              child: Text('More Info+',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: 10),
                            // ),
                            RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    settings: RouteSettings(
                                        name: ROUTE_ORDERSHIPMENT),
                                    builder: (context) => OrderShipmwnt(
                                        channelId: res.data[index].channelId,
                                        orderId: res.data[index].orderId,
                                        orderItemId:
                                            res.data[index].orderItemNumber[0],
                                        itemQty: res.data[index].productInfo[0]
                                            .itemQuantity,
                                        skuId: res.data[index].skuId[0],
                                        marketplaceId: res.data[index]
                                            .productInfo[0].marketplaceId),
                                  ),
                                );
                              },
                              child: Text('Ship'),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: 10),
                            // ),
                            RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    settings: RouteSettings(
                                        name: ROUTE_ORDERCANCELLATION),
                                    builder: (context) => OrderCancellation(
                                        channelId: res.data[index].channelId,
                                        orderId: res.data[index].orderId,
                                        orderItemId:
                                            res.data[index].orderItemNumber[0],
                                        itemQty: res.data[index].productInfo[0]
                                            .itemQuantity,
                                        skuId: res.data[index].skuId[0],
                                        marketplaceId: res.data[index]
                                            .productInfo[0].marketplaceId),
                                  ),
                                );
                              },
                              child: Text('Cancel'),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }),
          );
  }
}
