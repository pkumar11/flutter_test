import 'package:flutter/material.dart';
import 'package:eunimart/ui/orders/Orders_vm.dart';
import 'package:eunimart/app_models.dart';
import 'package:eunimart/ui/error/error.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  OrderVM orderVm = OrderVM();
  Future<OrderRes> mF;
  @override
  void initState() {
    super.initState();
    mF = orderVm.getOrderData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
                    mF = orderVm.getOrderData();
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

  Widget _buildList(BuildContext c, OrderRes res) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    print('${res}');
    return Container(
      margin: EdgeInsets.all(10),
      child: Center(
        child: Text('orderpafge'),
      ),
    );
  }
}
