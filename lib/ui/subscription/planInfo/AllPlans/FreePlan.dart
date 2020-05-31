import 'package:flutter/material.dart';
import 'package:eunimart/app_models.dart';
import 'package:eunimart/ui/error/error.dart';
import 'package:eunimart/ui/subscription/planInfo/AllPlans/AllPLans_vm.dart';

class FreePlan extends StatefulWidget {
  @override
  _FreePlanState createState() => _FreePlanState();
}

class _FreePlanState extends State<FreePlan> {
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
    print(res.data.plans[0].planDetails.planName);
    return Container(
      child: ListView(
        children: [
          Text('Key Features'),
          Row(
            children: [
              Expanded(
                flex: 12,
                child: Row(
                  children: [
                    Text('${res.data.plans[0].planLimits.skuId.limitName}'),
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
                    Text('${res.data.plans[0].planLimits.skuId.limitAllowed}'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
