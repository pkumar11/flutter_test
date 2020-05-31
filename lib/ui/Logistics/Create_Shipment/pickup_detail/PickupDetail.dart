import 'package:flutter/material.dart';
import 'package:eunimart/util/app_constants.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:eunimart/ui/Logistics/Create_Shipment/BillingDetails/BillingDetails.dart';
import 'package:intl/intl.dart';

class PickupDetail extends StatefulWidget {
  @override
  _PickupDetailState createState() => _PickupDetailState();
}

class _PickupDetailState extends State<PickupDetail> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var datePicked;
  DateTime _dateTime = DateTime.now();
  DateTime _currentDate = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay _fromtime = TimeOfDay.now();

  TimeOfDay picked;
  Future<void> selectTime(BuildContext context) async {
    picked = await showTimePicker(
      context: context,
      initialTime: _time,
      builder: (context, child) => SingleChildScrollView(
        child: child,
      ),
    );
    setState(() {
      _time = picked;
    });
  }

  Future<void> selectFromTime(BuildContext context) async {
    picked = await showTimePicker(
      context: context,
      initialTime: _time,
      builder: (context, child) => SingleChildScrollView(
        child: child,
      ),
    );
    setState(() {
      this._fromtime = picked;
    });
  }

  Future<void> _selectSelectToDate(BuildContext context) async {
    final DateTime datePicked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) => SingleChildScrollView(
        child: child,
      ),
    );
    if (datePicked != null) {
      setState(() {
        _dateTime = datePicked;
      });
    }
    print(_dateTime);
  }

  @override
  Widget build(BuildContext context) {
    var formatter = DateFormat('yMMMEd');

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
              Row(
                children: <Widget>[
                  Text('Pick up date'),
                  Text(
                    ' *',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              ListTile(
                onTap: () async {
                  _selectSelectToDate(context);
                },
                title: Text(datePicked == null
                    ? '${formatter.format(DateTime.parse(_dateTime.toString()))}'
                    : 'Enter pick up date'),
                trailing: Icon(
                  Icons.calendar_today,
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: GAP_LARGE)),
              Row(
                children: <Widget>[
                  Text('Pickup from'),
                  Text(
                    ' *',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              ListTile(
                onTap: () {
                  selectFromTime(context);
                  print(_time);
                },
                title: Text('$_fromtime'),
                trailing: Icon(Icons.date_range),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: GAP_LARGE),
              ),
              Row(
                children: <Widget>[
                  Text('pickup To'),
                  Text(
                    ' *',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              ListTile(
                onTap: () {
                  selectTime(context);
                  print(_time);
                },
                title: Text('$_time'),
                trailing: Icon(Icons.date_range),
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
