import 'package:flutter/material.dart';
import 'package:eunimart/app_models.dart';
import 'package:eunimart/ui/error/error.dart';
import 'package:eunimart/ui/subscription/planInfo/AllPlans/AllPLans_vm.dart';
import 'package:eunimart/ui/subscription/planInfo/AllPlans/FreePlan.dart';

class AllPlans extends StatefulWidget {
  @override
  _AllPlansState createState() => _AllPlansState();
}

class _AllPlansState extends State<AllPlans> {
  AllPlansVM allPlansVm = AllPlansVM();
  Future<PlansRes> mF;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    mF = allPlansVm.getPlansData();
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
      PlansRes _d = snap.data;
      // status = _d.status;

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
              p_title: 'Profile',
              m: _d.message,
              mL: () => setState(() {
                    _d.is_loading = true;
                    mF = allPlansVm.getPlansData();
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

  Widget _buildList(BuildContext c, PlansRes res) {
    print(
        '${res.data.plansComparision.plansValues.plansEcommerce[0].eventName}');
    return Container(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  text: 'Free',
                ),
                Tab(
                  text: 'Gold',
                ),
                Tab(
                  text: 'Diamond',
                ),
                Tab(text: 'Enterprice'),
              ],
            ),
            title: Text('All Plans'),
          ),
          body: TabBarView(
            children: [
              Container(
                // padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Text(
                      'key features',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                    ),
                                    Text(
                                        '${res.data.plans[0].planLimits.skuId.limitName}'),
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
                                    '${res.data.plans[0].planLimits.skuId.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[0].planLimits.marketchannels.limitName}'),
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
                                    '${res.data.plans[0].planLimits.marketchannels.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[0].planLimits.posStores.limitName}'),
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
                                    '${res.data.plans[0].planLimits.posStores.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[0].planLimits.posSubUsers.limitName}'),
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
                                    '${res.data.plans[0].planLimits.posSubUsers.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[0].planLimits.orders.limitName}'),
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
                                    '${res.data.plans[0].planLimits.orders.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[0].planLimits.shippingPartners.limitName}'),
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
                                    '${res.data.plans[0].planLimits.shippingPartners.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[0].planLimits.subUsers.limitName}'),
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
                                    '${res.data.plans[0].planLimits.subUsers.limitAllowed}'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                    Text('Pricing',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Container(
                      padding: EdgeInsets.all(10),
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
                                child: RaisedButton(
                                  onPressed: () {},
                                  child: Text(
                                      '${res.data.plansPricing.planFree.button}'),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                    Text('Features',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                    ),
                    Container(
                      child: Card(
                          child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                          ),
                          Text(
                              '${res.data.plansComparision.plansGroupingMeta[0].value}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[0].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[0]
                                        .eccomerceValueList[0]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[1].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[1]
                                        .eccomerceValueList[0]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[2].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[2]
                                        .eccomerceValueList[0]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[3].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[3]
                                        .eccomerceValueList[0]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[4].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[4]
                                        .eccomerceValueList[0]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[5].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[5]
                                        .eccomerceValueList[0]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                        ],
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      child: Card(
                          child: Column(
                        children: [
                          Text(
                              '${res.data.plansComparision.plansGroupingMeta[1].value}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansLogistics[0].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansLogistics[0]
                                        .logisticsValueList[0]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansLogistics[1].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansLogistics[1]
                                        .logisticsValueList[0]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansLogistics[2].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansLogistics[2]
                                        .logisticsValueList[0]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansLogistics[3].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansLogistics[3]
                                        .logisticsValueList[0]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansLogistics[4].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansLogistics[4]
                                        .logisticsValueList[0]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                        ],
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      child: Card(
                          child: Column(
                        children: [
                          Text(
                              '${res.data.plansComparision.plansGroupingMeta[2].value}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansPos[0].eventName}'),
                            trailing: res.data.plansComparision.plansValues
                                        .plansPos[0].posValueList[0].isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansPos[1].eventName}'),
                            trailing: res.data.plansComparision.plansValues
                                        .plansPos[1].posValueList[0].isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansPos[2].eventName}'),
                            trailing: res.data.plansComparision.plansValues
                                        .plansPos[2].posValueList[0].isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansPos[3].eventName}'),
                            trailing: res.data.plansComparision.plansValues
                                        .plansPos[3].posValueList[0].isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansPos[4].eventName}'),
                            trailing: res.data.plansComparision.plansValues
                                        .plansPos[4].posValueList[0].isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                        ],
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      child: Card(
                          child: Column(
                        children: [
                          Text(
                              '${res.data.plansComparision.plansGroupingMeta[3].value}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansSupport[0].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansSupport[0]
                                        .supportValueList[0]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansSupport[1].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansSupport[1]
                                        .supportValueList[0]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansSupport[2].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansSupport[2]
                                        .supportValueList[0]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansSupport[3].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansSupport[3]
                                        .supportValueList[0]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansSupport[4].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansSupport[4]
                                        .supportValueList[0]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                        ],
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      child: Card(
                          child: Column(
                        children: [
                          Text(
                              '${res.data.plansComparision.plansGroupingMeta[4].value}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansExtraFeatures[0].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansExtraFeatures[0]
                                        .extraFeaturesValueList[0]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansExtraFeatures[1].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansExtraFeatures[1]
                                        .extraFeaturesValueList[0]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansExtraFeatures[2].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansExtraFeatures[2]
                                        .extraFeaturesValueList[0]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
              ),
              /****************Second page*************************/

              Container(
                // padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Text('key features',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[1].planLimits.skuId.limitName}'),
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
                                    '${res.data.plans[1].planLimits.skuId.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[1].planLimits.marketchannels.limitName}'),
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
                                    '${res.data.plans[1].planLimits.marketchannels.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[1].planLimits.posStores.limitName}'),
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
                                    '${res.data.plans[1].planLimits.posStores.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[1].planLimits.posSubUsers.limitName}'),
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
                                    '${res.data.plans[1].planLimits.posSubUsers.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[1].planLimits.orders.limitName}'),
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
                                    '${res.data.plans[1].planLimits.orders.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[1].planLimits.shippingPartners.limitName}'),
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
                                    '${res.data.plans[1].planLimits.shippingPartners.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[1].planLimits.subUsers.limitName}'),
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
                                    '${res.data.plans[1].planLimits.subUsers.limitAllowed}'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                    ),
                    Text('Pricing',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plansPricing.planGold.goldplan1month.priceName}'),
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
                                        '${res.data.plansPricing.planGold.goldplan1month.currency}'),
                                    Padding(
                                      padding: EdgeInsets.only(right: 4),
                                    ),
                                    Text(
                                        '${res.data.plansPricing.planGold.goldplan1month.price}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plansPricing.planGold.goldplan3month.priceName}'),
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
                                        '${res.data.plansPricing.planGold.goldplan3month.currency}'),
                                    Padding(
                                      padding: EdgeInsets.only(right: 4),
                                    ),
                                    Text(
                                        '${res.data.plansPricing.planGold.goldplan3month.price}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plansPricing.planGold.goldplan6month.priceName}'),
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
                                        '${res.data.plansPricing.planGold.goldplan6month.currency}'),
                                    Padding(
                                      padding: EdgeInsets.only(right: 4),
                                    ),
                                    Text(
                                        '${res.data.plansPricing.planGold.goldplan6month.price}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plansPricing.planGold.goldplan12month.priceName}'),
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
                                        '${res.data.plansPricing.planGold.goldplan6month.currency}'),
                                    Padding(
                                      padding: EdgeInsets.only(right: 4),
                                    ),
                                    Text(
                                        '${res.data.plansPricing.planGold.goldplan12month.price}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                    Text('Features',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                    ),
                    Container(
                      child: Card(
                          child: Column(
                        children: [
                          Text(
                              '${res.data.plansComparision.plansGroupingMeta[0].value}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[0].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[0]
                                        .eccomerceValueList[1]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[1].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[1]
                                        .eccomerceValueList[1]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[2].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[2]
                                        .eccomerceValueList[1]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[3].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[3]
                                        .eccomerceValueList[1]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[4].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[4]
                                        .eccomerceValueList[1]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[5].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[5]
                                        .eccomerceValueList[1]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                        ],
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      child: Card(
                          child: Column(
                        children: [
                          Text(
                              '${res.data.plansComparision.plansGroupingMeta[1].value}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansLogistics[0].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansLogistics[0]
                                        .logisticsValueList[1]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansLogistics[1].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansLogistics[1]
                                        .logisticsValueList[1]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansLogistics[2].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansLogistics[2]
                                        .logisticsValueList[1]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansLogistics[3].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansLogistics[3]
                                        .logisticsValueList[1]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansLogistics[4].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansLogistics[4]
                                        .logisticsValueList[1]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                        ],
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      child: Card(
                          child: Column(
                        children: [
                          Text(
                              '${res.data.plansComparision.plansGroupingMeta[2].value}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansPos[0].eventName}'),
                            trailing: res.data.plansComparision.plansValues
                                        .plansPos[0].posValueList[1].isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansPos[1].eventName}'),
                            trailing: res.data.plansComparision.plansValues
                                        .plansPos[1].posValueList[1].isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansPos[2].eventName}'),
                            trailing: res.data.plansComparision.plansValues
                                        .plansPos[2].posValueList[1].isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansPos[3].eventName}'),
                            trailing: res.data.plansComparision.plansValues
                                        .plansPos[3].posValueList[1].isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansPos[4].eventName}'),
                            trailing: res.data.plansComparision.plansValues
                                        .plansPos[4].posValueList[1].isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                        ],
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      child: Card(
                          child: Column(
                        children: [
                          Text(
                              '${res.data.plansComparision.plansGroupingMeta[3].value}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansSupport[0].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansSupport[0]
                                        .supportValueList[1]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansSupport[1].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansSupport[1]
                                        .supportValueList[1]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansSupport[2].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansSupport[2]
                                        .supportValueList[1]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansSupport[3].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansSupport[3]
                                        .supportValueList[1]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansSupport[4].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansSupport[4]
                                        .supportValueList[1]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                        ],
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      child: Card(
                          child: Column(
                        children: [
                          Text(
                              '${res.data.plansComparision.plansGroupingMeta[4].value}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansExtraFeatures[0].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansExtraFeatures[0]
                                        .extraFeaturesValueList[1]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansExtraFeatures[1].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansExtraFeatures[1]
                                        .extraFeaturesValueList[1]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansExtraFeatures[2].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansExtraFeatures[2]
                                        .extraFeaturesValueList[1]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
              ),
              /****************Third page*************************/
              Container(
                // padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Text('key features',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[2].planLimits.skuId.limitName}'),
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
                                    '${res.data.plans[2].planLimits.skuId.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[2].planLimits.marketchannels.limitName}'),
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
                                    '${res.data.plans[2].planLimits.marketchannels.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[2].planLimits.posStores.limitName}'),
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
                                    '${res.data.plans[2].planLimits.posStores.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[2].planLimits.posSubUsers.limitName}'),
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
                                    '${res.data.plans[2].planLimits.posSubUsers.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[2].planLimits.orders.limitName}'),
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
                                    '${res.data.plans[2].planLimits.orders.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[2].planLimits.shippingPartners.limitName}'),
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
                                    '${res.data.plans[2].planLimits.shippingPartners.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[2].planLimits.subUsers.limitName}'),
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
                                    '${res.data.plans[2].planLimits.subUsers.limitAllowed}'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                    ),
                    Text('Pricing',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plansPricing.planDiamond.diamondplan1month.priceName}'),
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
                                        '${res.data.plansPricing.planDiamond.diamondplan1month.currency}'),
                                    Padding(
                                      padding: EdgeInsets.only(right: 4),
                                    ),
                                    Text(
                                        '${res.data.plansPricing.planDiamond.diamondplan1month.price}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plansPricing.planDiamond.diamondplan3month.priceName}'),
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
                                        '${res.data.plansPricing.planDiamond.diamondplan3month.currency}'),
                                    Padding(
                                      padding: EdgeInsets.only(right: 4),
                                    ),
                                    Text(
                                        '${res.data.plansPricing.planDiamond.diamondplan3month.price}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plansPricing.planDiamond.diamondplan6month.priceName}'),
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
                                        '${res.data.plansPricing.planDiamond.diamondplan6month.currency}'),
                                    Padding(
                                      padding: EdgeInsets.only(right: 4),
                                    ),
                                    Text(
                                        '${res.data.plansPricing.planDiamond.diamondplan6month.price}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plansPricing.planDiamond.diamondplan12month.priceName}'),
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
                                        '${res.data.plansPricing.planDiamond.diamondplan6month.currency}'),
                                    Padding(
                                      padding: EdgeInsets.only(right: 4),
                                    ),
                                    Text(
                                        '${res.data.plansPricing.planDiamond.diamondplan12month.price}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                    Text('Features',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                    ),
                    Container(
                      child: Card(
                          child: Column(
                        children: [
                          Text(
                              '${res.data.plansComparision.plansGroupingMeta[0].value}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[0].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[0]
                                        .eccomerceValueList[2]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[1].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[1]
                                        .eccomerceValueList[2]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[2].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[2]
                                        .eccomerceValueList[2]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[3].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[3]
                                        .eccomerceValueList[2]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[4].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[4]
                                        .eccomerceValueList[2]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[5].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[5]
                                        .eccomerceValueList[2]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                        ],
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      child: Card(
                          child: Column(
                        children: [
                          Text(
                              '${res.data.plansComparision.plansGroupingMeta[1].value}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansLogistics[0].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansLogistics[0]
                                        .logisticsValueList[2]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansLogistics[1].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansLogistics[1]
                                        .logisticsValueList[2]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansLogistics[2].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansLogistics[2]
                                        .logisticsValueList[2]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansLogistics[3].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansLogistics[3]
                                        .logisticsValueList[2]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansLogistics[4].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansLogistics[4]
                                        .logisticsValueList[2]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                        ],
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      child: Card(
                          child: Column(
                        children: [
                          Text(
                              '${res.data.plansComparision.plansGroupingMeta[2].value}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansPos[0].eventName}'),
                            trailing: res.data.plansComparision.plansValues
                                        .plansPos[0].posValueList[2].isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansPos[1].eventName}'),
                            trailing: res.data.plansComparision.plansValues
                                        .plansPos[1].posValueList[2].isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansPos[2].eventName}'),
                            trailing: res.data.plansComparision.plansValues
                                        .plansPos[2].posValueList[2].isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansPos[3].eventName}'),
                            trailing: res.data.plansComparision.plansValues
                                        .plansPos[3].posValueList[2].isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansPos[4].eventName}'),
                            trailing: res.data.plansComparision.plansValues
                                        .plansPos[4].posValueList[2].isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                        ],
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      child: Card(
                          child: Column(
                        children: [
                          Text(
                              '${res.data.plansComparision.plansGroupingMeta[3].value}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansSupport[0].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansSupport[0]
                                        .supportValueList[2]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansSupport[1].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansSupport[1]
                                        .supportValueList[2]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansSupport[2].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansSupport[2]
                                        .supportValueList[2]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansSupport[3].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansSupport[3]
                                        .supportValueList[2]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansSupport[4].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansSupport[4]
                                        .supportValueList[2]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                        ],
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      child: Card(
                          child: Column(
                        children: [
                          Text(
                              '${res.data.plansComparision.plansGroupingMeta[4].value}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansExtraFeatures[0].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansExtraFeatures[0]
                                        .extraFeaturesValueList[2]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansExtraFeatures[1].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansExtraFeatures[1]
                                        .extraFeaturesValueList[2]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansExtraFeatures[2].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansExtraFeatures[2]
                                        .extraFeaturesValueList[2]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
              ),
              /****************Fourth page*************************/

              Container(
                // padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Text('key features',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[3].planLimits.skuId.limitName}'),
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
                                    '${res.data.plans[3].planLimits.skuId.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[3].planLimits.marketchannels.limitName}'),
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
                                    '${res.data.plans[3].planLimits.marketchannels.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[3].planLimits.posStores.limitName}'),
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
                                    '${res.data.plans[3].planLimits.posStores.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[3].planLimits.posSubUsers.limitName}'),
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
                                    '${res.data.plans[3].planLimits.posSubUsers.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[3].planLimits.orders.limitName}'),
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
                                    '${res.data.plans[3].planLimits.orders.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[3].planLimits.shippingPartners.limitName}'),
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
                                    '${res.data.plans[3].planLimits.shippingPartners.limitAllowed}'),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 12,
                                child: Row(
                                  children: [
                                    Text(
                                        '${res.data.plans[3].planLimits.subUsers.limitName}'),
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
                                    '${res.data.plans[3].planLimits.subUsers.limitAllowed}'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                    Text('Pricing',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
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
                                child: RaisedButton(
                                  onPressed: () {},
                                  child: Text('Contact us'),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                    Text('Features',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Container(
                      child: Card(
                          child: Column(
                        children: [
                          Text(
                              '${res.data.plansComparision.plansGroupingMeta[0].value}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[0].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[0]
                                        .eccomerceValueList[3]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[1].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[1]
                                        .eccomerceValueList[3]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[2].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[2]
                                        .eccomerceValueList[3]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[3].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[3]
                                        .eccomerceValueList[3]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[4].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[4]
                                        .eccomerceValueList[3]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansEcommerce[5].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansEcommerce[5]
                                        .eccomerceValueList[3]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                        ],
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      child: Card(
                          child: Column(
                        children: [
                          Text(
                              '${res.data.plansComparision.plansGroupingMeta[1].value}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansLogistics[0].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansLogistics[0]
                                        .logisticsValueList[3]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansLogistics[1].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansLogistics[1]
                                        .logisticsValueList[3]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansLogistics[2].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansLogistics[2]
                                        .logisticsValueList[3]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansLogistics[3].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansLogistics[3]
                                        .logisticsValueList[3]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansLogistics[4].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansLogistics[4]
                                        .logisticsValueList[3]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                        ],
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      child: Card(
                          child: Column(
                        children: [
                          Text(
                              '${res.data.plansComparision.plansGroupingMeta[2].value}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansPos[0].eventName}'),
                            trailing: res.data.plansComparision.plansValues
                                        .plansPos[0].posValueList[3].isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansPos[1].eventName}'),
                            trailing: res.data.plansComparision.plansValues
                                        .plansPos[1].posValueList[3].isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansPos[2].eventName}'),
                            trailing: res.data.plansComparision.plansValues
                                        .plansPos[2].posValueList[3].isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansPos[3].eventName}'),
                            trailing: res.data.plansComparision.plansValues
                                        .plansPos[3].posValueList[3].isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansPos[4].eventName}'),
                            trailing: res.data.plansComparision.plansValues
                                        .plansPos[4].posValueList[3].isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                        ],
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      child: Card(
                          child: Column(
                        children: [
                          Text(
                              '${res.data.plansComparision.plansGroupingMeta[3].value}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansSupport[0].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansSupport[0]
                                        .supportValueList[3]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansSupport[1].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansSupport[1]
                                        .supportValueList[3]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansSupport[2].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansSupport[2]
                                        .supportValueList[3]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansSupport[3].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansSupport[3]
                                        .supportValueList[3]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansSupport[4].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansSupport[4]
                                        .supportValueList[3]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                        ],
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Container(
                      child: Card(
                          child: Column(
                        children: [
                          Text(
                              '${res.data.plansComparision.plansGroupingMeta[4].value}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansExtraFeatures[0].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansExtraFeatures[0]
                                        .extraFeaturesValueList[3]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansExtraFeatures[1].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansExtraFeatures[1]
                                        .extraFeaturesValueList[3]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                          ListTile(
                            title: Text(
                                '${res.data.plansComparision.plansValues.plansExtraFeatures[2].eventName}'),
                            trailing: res
                                        .data
                                        .plansComparision
                                        .plansValues
                                        .plansExtraFeatures[2]
                                        .extraFeaturesValueList[3]
                                        .isValid ==
                                    1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
