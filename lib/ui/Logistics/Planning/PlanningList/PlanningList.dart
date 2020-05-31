import 'package:eunimart/app_models.dart';
import 'package:flutter/material.dart';
import 'package:eunimart/ui/Logistics/Planning/PlanningDetail/PlanningDetail.dart';
import 'package:eunimart/util/app_constants.dart';

class PlanningList extends StatefulWidget {
  final List data;

  PlanningList({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  _PlanningListState createState() => _PlanningListState();
}

class _PlanningListState extends State<PlanningList> {
  @override
  Widget build(BuildContext context) {
    print('${widget.data}');
    return Scaffold(
        appBar: AppBar(
          title: Text('Planning List'),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: widget.data.length,
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
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      print(widget.data[index].carrier);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          settings: RouteSettings(name: ROUTE_PLANNINGDETAIL),
                          builder: (context) => PlanningDetail(
                            carrier: widget.data[index].carrier,
                            length: widget.data[index].length,
                            width: widget.data[index].width,
                            height: widget.data[index].height,
                            weight: widget.data[index].weight,
                            from: widget.data[index].from,
                            to: widget.data[index].to,
                            volumetricWeight: widget.data[index]
                              ..volumetricWeight,
                            weightConsidered: widget.data[index]
                              ..weightConsidered,
                            price: widget.data[index].price,
                            shippingPartnerId:
                                widget.data[index].shippingPartnerId,
                            shipmentType: widget.data[index].shipmentType,
                            timeline: widget.data[index].timeline,
                            currency: widget.data[index].currency,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${widget.data[index].carrier}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${widget.data[index].currency}'),
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                            ),
                            Text('${widget.data[index].price}')
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                        ),
                        Text('${widget.data[index].timeline}'),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                        ),
                        GestureDetector(
                          child: Text(
                            'More info+',
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
