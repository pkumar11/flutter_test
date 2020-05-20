import 'package:flutter/material.dart';
import 'package:eunimart/util/app_constants.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:eunimart/ui/Logistics/Create_Shipment/BillingDetails/BillingDetails.dart';

class PickupDetail extends StatefulWidget {
  @override
  _PickupDetailState createState() => _PickupDetailState();
}

class _PickupDetailState extends State<PickupDetail> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var datePicked;
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Pickup Detail'),
      ),
      body: Container(
          padding: EdgeInsets.all(GAP_XLARGE),
          child: ListView(
            children: <Widget>[
              Text('Enter the details'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              Text('Pick up date'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(datePicked != null
                      ? '$datePicked'
                      : 'Enter pick up date'),
                  GestureDetector(
                    child: Icon(
                      Icons.calendar_today,
                    ),
                    onTap: () async {
                      datePicked = await DatePicker.showSimpleDatePicker(
                        context,
                        initialDate: DateTime(2020),
                        firstDate: DateTime(1960),
                        pickerMode: DateTimePickerMode.date,
                        // lastDate: DateTime(2012),
                        dateFormat: "dd-MMMM-yyyy",
                        locale: DateTimePickerLocale.en_us,
                        looping: true,
                      );
                      return datePicked;
                    },
                  )
                ],
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: GAP_LARGE)),
              Text('Pickup from'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('$_dateTime'),
                  GestureDetector(
                    onTap: hourMinute,
                    child: Icon(Icons.date_range),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
              ),
              Text('pickup To'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('$_dateTime'),
                  GestureDetector(
                    onTap: hourMinute,
                    child: Icon(Icons.date_range),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: GAP_XLARGE),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        settings: RouteSettings(name: ROUTE_PICKUPDETAIL),
                        builder: (context) => BillingDetails()),
                  );
                },
                child: Text('Billing Details'),
              )
            ],
          )),
    );
  }

  Widget hourMinute() {
    print('lllllllll');
    return TimePickerSpinner(
      is24HourMode: true,
      spacing: 50,
      itemHeight: 80,
      isForce2Digits: true,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }
}
