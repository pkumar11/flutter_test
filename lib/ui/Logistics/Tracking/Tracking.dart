import 'package:flutter/material.dart';
import 'package:eunimart/ui/Logistics/Tracking/Tracking_vm.dart';
import 'package:eunimart/ui/error/error.dart';
import 'package:eunimart/app_models.dart';

class Tracking extends StatefulWidget {
  @override
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  TrackingVM trackingVm = TrackingVM();
  Future<TrackingLogisticsRes> mF;

  String _value;
  TextEditingController trackingNo = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    mF = trackingVm.getLogisticsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Tracking'),
        ),
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
      TrackingLogisticsRes _d = snap.data;
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
          backgroundColor: Colors.white24,
          //backgroundColor: Theme.of(context).primaryColor,
//          appBar: AppBarr(),
          body: Err(
              bar_visibility: false,
              p_title: 'Profile',
              m: _d.message,
              mL: () => setState(() {
                    _d.is_loading = true;
                    mF = trackingVm.getLogisticsData();
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

  Widget _buildList(BuildContext c, TrackingLogisticsRes res) {
    print('${res.data[0].logo}');

    return Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            Text(
              'Tracking No:',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                  style: TextStyle(color: Colors.black),
                  controller: trackingNo,
                  enableInteractiveSelection: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Tracking Number',
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
              padding: EdgeInsets.symmetric(vertical: 5),
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
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Image.network(
                              '${res.data[0].logo}',
                              height: 40,
                              width: 100,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                          ),
                          Text(
                            '${res.data[0].name}',
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                      )
                    ],
                  ),
                  value: res.data[0].id.toString(),
                ),
                DropdownMenuItem<String>(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Image.network(
                              '${res.data[1].logo}',
                              height: 50,
                              width: 100,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                          ),
                          Text('${res.data[1].name}'),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                      )
                    ],
                  ),
                  value: res.data[1].id.toString(),
                ),
                DropdownMenuItem<String>(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Image.network(
                              '${res.data[2].logo}',
                              height: 50,
                              width: 100,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                          ),
                          Text('${res.data[2].name}'),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                      )
                    ],
                  ),
                  value: res.data[2].id.toString(),
                ),
                DropdownMenuItem<String>(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Image.network(
                              '${res.data[3].logo}',
                              height: 50,
                              width: 100,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                          ),
                          Text('${res.data[3].name}'),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                      )
                    ],
                  ),
                  value: res.data[3].id.toString(),
                ),
                DropdownMenuItem<String>(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Image.network(
                              '${res.data[4].logo}',
                              height: 50,
                              width: 100,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                          ),
                          Text('${res.data[4].name}'),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                      )
                    ],
                  ),
                  value: res.data[4].id.toString(),
                ),
                DropdownMenuItem<String>(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Image.network(
                              '${res.data[5].logo}',
                              height: 50,
                              width: 100,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                          ),
                          Text('${res.data[5].name}'),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                      )
                    ],
                  ),
                  value: res.data[5].id.toString(),
                ),
                DropdownMenuItem<String>(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Image.network(
                              '${res.data[6].logo}',
                              height: 50,
                              width: 100,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                          ),
                          Text('${res.data[6].name}'),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                      )
                    ],
                  ),
                  value: res.data[6].id.toString(),
                ),
                DropdownMenuItem<String>(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Image.network(
                              '${res.data[7].logo}',
                              height: 50,
                              width: 100,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                          ),
                          Text('${res.data[7].name}'),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                      )
                    ],
                  ),
                  value: res.data[7].id.toString(),
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
              padding: EdgeInsets.all(10),
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('Submit'),
            )
          ],
        ));
  }
}
