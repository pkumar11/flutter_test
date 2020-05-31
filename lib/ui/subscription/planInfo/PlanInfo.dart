import 'package:flutter/material.dart';
import 'package:eunimart/util/app_constants.dart';

import 'package:eunimart/ui/subscription/planInfo/AllPlans/AllPlans.dart';

class PlanInfo extends StatefulWidget {
  @override
  _PlanInfoState createState() => _PlanInfoState();
}

class _PlanInfoState extends State<PlanInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('There is no active plan right now'),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  settings: RouteSettings(name: ROUTE_ALLPLANS),
                  builder: (context) => AllPlans()),
            );
          },
          child: Text('All plans'),
        )
      ],
    ));
  }
}
